
#include <iostream>
#include <iomanip>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/time.h>
#include <stdint.h>
#include <time.h>
#include "sp12_macros.h"
#include "CAENVMEtypes.h"
#include "vme_client.h"

extern char key;
extern bool terminating;
// [fiber][word]
uint16_t tddd[8][2048];


int mpc_base[1] =
{
      0x180000 // mpc base address pos 3 (uf)
  //    0x200000 // mpc base address pos 4 (rice)
//    0x280000 // mpc base address pos 5
};

int ttc_config()
{
    int32_t BHandle;
    uint32_t value;

    if( CAENVME_Init(/*VMEBoard*/cvV2718, /*Link*/0, /*Device*/0, &BHandle) != cvSuccess )
    {
        log_printf("\n\n Error opening VME controller driver\n");
    }

    log_printf ("TTC configuration\n");
    value = 0; // reset TTCvi
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1084,&value, cvA24_U_DATA, cvD16));
    usleep (1000000);

    // BGO0 = BC0

    value = 0xd; // program BGO0 for sync repetitive mode
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1090,&value, cvA24_U_DATA, cvD16));

    value = 0x1000; // reset BGO0 fifo
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1082,&value, cvA24_U_DATA, cvD16));

    value = 0; // read BGO0 fifo status
    check_ret (CAENVME_ReadCycle(BHandle, 0xff1082,&value, cvA24_U_DATA, cvD16));
    value &= 3;

    log_printf ("BGO0 fifo full/empty flags before filling: %d\n", value);

    // load BGO0 fifo (have to use 32-bit data here)
    value = 1ull << 23; // first location contains BC0 command
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10b0,&value, cvA24_U_DATA, cvD32));

    value = 0; // read BGO0 fifo status
    check_ret (CAENVME_ReadCycle(BHandle, 0xff1082,&value, cvA24_U_DATA, cvD16));
    value &= 3;

    log_printf ("BGO0 fifo full/empty flags after  filling: %d\n", value);

    value = 0; // inhibit0 delay
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1092,&value, cvA24_U_DATA, cvD16));

    value = 44; // inhibit0 duration
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1094,&value, cvA24_U_DATA, cvD16));


    // BGO1 = resync


    value = 0x9; // program BGO1 for sync single mode
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1098,&value, cvA24_U_DATA, cvD16));

    value = 0x2000; // reset BGO1 fifo
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1082,&value, cvA24_U_DATA, cvD16));

    value = 100; // inhibit1 delay (should not match other inhibit delays)
    check_ret (CAENVME_WriteCycle(BHandle, 0xff109a,&value, cvA24_U_DATA, cvD16));

    value = 44; // inhibit1 duration
    check_ret (CAENVME_WriteCycle(BHandle, 0xff109c,&value, cvA24_U_DATA, cvD16));

    log_printf ("BGO1 configured\n");
    // BGO2 = ECR

    value = 0x9; // program BGO2 for sync single mode
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10a0,&value, cvA24_U_DATA, cvD16));

    value = 0x4000; // reset BGO2 fifo
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1082,&value, cvA24_U_DATA, cvD16));

    value = 200; // inhibit2 delay (should not match other inhibit delays)
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10a2,&value, cvA24_U_DATA, cvD16));

    value = 44; // inhibit2 duration
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10a4,&value, cvA24_U_DATA, cvD16));

    log_printf ("BGO2 configured\n");

    CAENVME_End(BHandle);
    return 0;
}

int random_trigger(int code, bool enable)
{
    int32_t BHandle;
    uint32_t value;

    if( CAENVME_Init(/*VMEBoard*/cvV2718, /*Link*/0, /*Device*/0, &BHandle) != cvSuccess )
    {
        log_printf("\n\n Error opening VME controller driver\n");
    }

    value = 0;
    check_ret (CAENVME_ReadCycle(BHandle, 0xff1080,&value, cvA24_U_DATA, cvD16));
    log_printf ("TTCvi CSR1 before: %04x\n", value & 0xffff);

    value &= 0x8ff8;
    value |=  (code & 7) << 12; // trigger rate
    value |= enable ? 5 : 7; // use random or disable
    check_ret (CAENVME_WriteCycle(BHandle, 0xff1080,&value, cvA24_U_DATA, cvD16));

    value = 0;
    check_ret (CAENVME_ReadCycle(BHandle, 0xff1080,&value, cvA24_U_DATA, cvD16));
    log_printf ("TTCvi CSR1 after : %04x\n", value & 0xffff);

    if (enable)
        log_printf ("random triggers programmed, rate code: %d (via TTCvi)\n", code);
    else
        log_printf ("random triggers disabled\n");

    CAENVME_End(BHandle);
    return 0;
}

int ttc_command(int code)
{
    int32_t BHandle;
    uint32_t value;

    if( CAENVME_Init(/*VMEBoard*/cvV2718, /*Link*/0, /*Device*/0, &BHandle) != cvSuccess )
    {
        log_printf("\n\n Error opening VME controller driver\n");
    }

    switch (code)
    {
    case 3:
        // load BGO2 fifo (have to use 32-bit data here)
        value = 2 << 23; // first location contains command
        check_ret (CAENVME_WriteCycle(BHandle, 0xff10b8,&value, cvA24_U_DATA, cvD32));
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle, 0xff10a6,&value, cvA24_U_DATA, cvD16));
        break;
    case 4:
        // load BGO1 fifo (have to use 32-bit data here)
        value = 4 << 23; // first location contains command
        check_ret (CAENVME_WriteCycle(BHandle, 0xff10b4,&value, cvA24_U_DATA, cvD32));
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle, 0xff109e,&value, cvA24_U_DATA, cvD16));
        break;
    case 8:
        value = code;
        check_ret (CAENVME_WriteCycle(BHandle, 0xff10c4,&value, cvA24_U_DATA, cvD16));
        break;
    }

    log_printf ("ttc command %d sent (via TTCvi)\n", code);

    CAENVME_End(BHandle);
    return 0;

}


int read_mpc_spy_mem(uint16_t mpc_fiber[8][512], int mpc_ind)
{
    // for test memory loopback
    uint32_t LB_MEM_SIZE = 0x10000; //size of loopback buffer in sp12, bytes
    uint32_t DATA_SIZE = 0x800; //one transfer size
    uint32_t N_WRITES = (LB_MEM_SIZE / DATA_SIZE); // how many transfers for entire buffer
    // loopback module addresses
    uint32_t MEM_BASE = 0x100000; // 0xc0000 // bytes
    uint64_t REG_BASE = 0x40ULL; // 0x60ULL // bytes


    uint16_t read_buf[LB_MEM_SIZE/2];

    memset(read_buf, 0x0, LB_MEM_SIZE);

    int fd = device_d;

    for (uint32_t j = 0; j < N_WRITES; j++)
    {
        off_t pos = (REG_BASE << 32) + MEM_BASE + j * DATA_SIZE;
        mread(fd, &(read_buf[j * DATA_SIZE/2]), DATA_SIZE, pos);
    }


//    FILE* fmpc = fopen ("mpc_dump.dat", "w");
//    for (int mi = 0; mi < 1; mi++) // mpc loop
	int mi = mpc_ind;
    {
        // form file name
        //            char fname [100];
        //            sprintf (fname, "mpc_%d_fiber_%d.dat", mi, fi);
        //            FILE* fmpc = fopen (fname, "w");

        for (int wi = 0; wi < 512; wi++) //word loop
        {
//            fprintf (fmpc, "%03d  ", wi);
            for (int fi = 0; fi < 8; fi++) // fiber loop
            {
                int wn = mi*8 + fi + wi*64; // word index in array
//                fprintf(fmpc, "%04x ", read_buf[wn]);
                mpc_fiber[fi][wi] = read_buf[wn];
//                if (read_buf[wn] == 0xfeed) fprintf(fmpc, "*** ");
//                else fprintf(fmpc, "    ");
            }
//            fprintf (fmpc, "\n");

            //            fclose (fmpc);
        }
    }
//    fclose (fmpc);

//    log_printf ("MPC dump made\n");

    return 0;

}

int mpc_idle(/*uint32_t idle_code_uint, uint32_t idle_k_uint*/)
{
    int32_t BHandle;

    if( CAENVME_Init(/*VMEBoard*/cvV2718, /*Link*/0, /*Device*/0, &BHandle) != cvSuccess )
    {
        log_printf("\n\n Error opening VME controller driver\n");
    }

    log_printf ("enable IDLE\n");


    for (unsigned i = 0; i < sizeof(mpc_base)/sizeof(int); i++)
    {
            // remove PRBS from MPC
        uint32_t value = 0x0; // no PRBS
        check_ret(CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xb8,&value, cvA24_U_DATA, cvD16));

        //program CSR0 of MPC
//        value = 0x6201;
//        value = 0x6001; // bit 9 = 0 sets IDLE on TLK transmitters
//        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i],&value, cvA24_U_DATA, cvD16));
		/*
        // send idle from MPC
        value = 0x50bc; // data pattern
//        value = 0xfeed;
//        value = idle_code_uint;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xb4,&value, cvA24_U_DATA, cvD16));
        log_printf ("wrote data word: %x\n", value);

        // read back data pattern
//        check_ret (CAENVME_ReadCycle(BHandle,mpc_base[i] + 0xb4,&rb, cvA24_U_DATA, cvD16));
//        if (rb != value)
//            log_printf("readback mismatch: %04x\n", rb);

        value = 0xbf; // txcharisk + PMA phase control
//        value = 0x80; // txcharisk + PMA phase contro
//        value = 0;
//        value = 0x3f | ((idle_k_uint & 3) << 7);
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xba,&value, cvA24_U_DATA, cvD16));
        log_printf ("wrote charisk word: %x\n", value);
        value = 3; // enable IDLE
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xac,&value, cvA24_U_DATA, cvD16));
		*/
	  value = 0;
	  check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xb6, &value, cvA24_U_DATA, cvD16));
	  // WriteRegister(0x6000B4, 0x50BC);
	  value = 0x50bc;
	  check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xb4, &value, cvA24_U_DATA, cvD16));
	  // WriteRegister(0x6000BA, 0xBF);
	  value = 0xbf;
	  check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xba, &value, cvA24_U_DATA, cvD16));
	  // WriteRegister(0x6000AC, 0x3002);
	  value = 0x3002; // enable pattern transmission
	  check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xac, &value, cvA24_U_DATA, cvD16));

	  usleep (10000);

	  value = 0x3000; // disable pattern transmission
	  check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xac, &value, cvA24_U_DATA, cvD16));
    }
    CAENVME_End(BHandle);
    return 0;
}


int mpc_prep()
{
    int32_t BHandle;
    //static bool first_time = true;
    uint32_t value;

    if( CAENVME_Init(/*VMEBoard*/cvV2718, /*Link*/0, /*Device*/0, &BHandle) != cvSuccess )
    {
        log_printf("\n\n Error opening VME controller driver\n");
    }


    // MPC fw version

    // MPC preparation
    log_printf("remove PRBS, remove IDLE, enable all TMBs\n");

    for (unsigned i = 0; i < sizeof(mpc_base)/sizeof(int); i++)
    {
      // MPC hard reset
        uint32_t value = 0x0; 
        check_ret(CAENVME_WriteCycle(BHandle,mpc_base[i] + 0x2,&value, cvA24_U_DATA, cvD16));
        usleep(1000000);

		//		continue;

        // reset GTPs
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xcc, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000CC, 0x3F);
        value = 0x3f;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xcc ,&value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000CC, 0);
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xcc ,&value, cvA24_U_DATA, cvD16));


        check_ret(CAENVME_ReadCycle(BHandle,mpc_base[i] + 0xaa,&value, cvA24_U_DATA, cvD16));
        int myear = (value >> 9) & 0xf;
        int mmonth = (value >> 5) & 0xf;
        int mday = value & 0x1f;
        log_printf ("MPC fw date: %d/%d/%d raw: %08x\n", mmonth, mday, myear+2000, value);

        check_ret(CAENVME_ReadCycle(BHandle,mpc_base[i] + 0xae,&value, cvA24_U_DATA, cvD16));
        log_printf ("MPC AE register: %08x\n", value);

        /*
        // remove PRBS from MPC
        value = 0x0; // no PRBS
        check_ret(CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xb8,&value, cvA24_U_DATA, cvD16));

        //program CSR0 of MPC
        value = 0x6201; // bit 9 = 1 removes IDLE from TLK transmitters
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i],&value, cvA24_U_DATA, cvD16));

        value = 0; // disable IDLE on GTP
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xac,&value, cvA24_U_DATA, cvD16));
        value = 0x3f; // txcharisk + PMA phase control
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xba,&value, cvA24_U_DATA, cvD16));
		*/
        // enable all tmbs
//        if (first_time)
        {
            value = 0x5555;
            check_ret (CAENVME_ReadCycle(BHandle,mpc_base[i] + 0xca,&value, cvA24_U_DATA, cvD16));
            log_printf("enable TMB readback: %08x\n", value);

            value = 0xffff;
//            value = 0;
            check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 6,&value, cvA24_U_DATA, cvD16));
            //first_time = false;
            log_printf("enable TMBs (new MPC) or reset DLL (old MPC)\n");

            value = 0xaaaa;
            check_ret (CAENVME_ReadCycle(BHandle,mpc_base[i] + 0xca,&value, cvA24_U_DATA, cvD16));
            log_printf("enable TMB readback: %08x\n", value);
        }

        // write board ID
        // read CSR0
        check_ret (CAENVME_ReadCycle(BHandle,mpc_base[i] + 0,&value, cvA24_U_DATA, cvD16));
        log_printf("CSR0 readback: %08x\n", value);

        // implant ID
        int bid = i + 10;
//        value &= 0xf3e1;
        value &= 0xf3e0; // set normal mode (not test FIFOs)
        value |= bid & 0x1e;

        // write back
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i] + 0,&value, cvA24_U_DATA, cvD16));

        check_ret (CAENVME_ReadCycle(BHandle,mpc_base[i] + 0,&value, cvA24_U_DATA, cvD16));
        log_printf("CSR0 readback: %08x\n", value);


    }


// TTC boards shamanizing
// according to Mike's message from 10-15-2013
//    write 8000h to address FF10C0h
    value = 0x8000;
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10c0,&value, cvA24_U_DATA, cvD16));
//   - write 0 to FF10C2h
    value = 0x0;
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10c2,&value, cvA24_U_DATA, cvD16));
//   - write 100h to FF10C2h
    value = 0x100;
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10c2,&value, cvA24_U_DATA, cvD16));
//   - write 200h to FF10C2h
    value = 0x200;
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10c2,&value, cvA24_U_DATA, cvD16));
//   - write 3b3h to FF10C2h
    value = 0x3b3;
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10c2,&value, cvA24_U_DATA, cvD16));
//   - write 8001h to FF10C0h
    value = 0x8001;
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10c0,&value, cvA24_U_DATA, cvD16));
//   - write 0 to FF10C2h
    value = 0x0;
    check_ret (CAENVME_WriteCycle(BHandle, 0xff10c2,&value, cvA24_U_DATA, cvD16));

    CAENVME_End(BHandle);


    return 0;

}

uint64_t bad_alignment;

void mpc_test(int mpc_test_index, int mpc_iterations)
{

//    int fd = device_d;
//    uint32_t val, ret;

    uint16_t *read_buf = (uint16_t *)malloc(8192);

    int32_t BHandle;

    if( CAENVME_Init(/*VMEBoard*/cvV2718, /*Link*/0, /*Device*/0, &BHandle) != cvSuccess )
    {
        log_printf("\n\n Error opening VME controller driver\n");
    }

    uint32_t value;
    int tmb, lct, i;
    unsigned short rlct[2][9][1024][2][2]; // indexes are:[MPC][TMB][data_word][LCT][Frame]

    log_printf ("Testing with MPC\n");


    //[tmb][lct] arrays for FEED patterns
    int vl[9][2], qt[9][2], cp[9][2], wg[9][2], hs[9][2], lr[9][2], bc[9][2], bx[9][2], se[9][2];
    bzero(vl, sizeof(vl));
    bzero(qt, sizeof(qt));
    bzero(cp, sizeof(cp));
    bzero(wg, sizeof(wg));
    bzero(hs, sizeof(hs));
    bzero(lr, sizeof(lr));
    bzero(bc, sizeof(bc));
    bzero(bx, sizeof(bx));
    bzero(se, sizeof(se));

    // fill arrays with FEED patterns
    lct = 0;
    for (int tmb = 1; tmb < 9; tmb++)
    {
        wg[tmb][lct] = 0x7E;  hs[tmb][lct] = 0xED;
//        bc[tmb][lct] = 1; // add bc0 flag to feed pattern
    }



    int feed_lct[9][2], flv, valid_lct[9][2];
    bzero(feed_lct, sizeof (feed_lct));
    // construct LCTs with FEED patterns + valid bits, and separately with just valid bits
    // FIFO_A format for MPC

    for (tmb = 0; tmb < 9; tmb++)
    {
        for (lct = 0; lct < 2; lct++)
        {

            vl[tmb][lct] = 1; // MPC is analyzing valid bits somewhere, so have to set them all to 1

            flv = wg[tmb][lct];
            flv |= cp[tmb][lct] << 7;
            flv |= qt[tmb][lct] << 11;
            flv |= vl[tmb][lct] << 15;
            flv |= hs[tmb][lct] << 16;
            flv |= lr[tmb][lct] << 24;
            flv |= se[tmb][lct] << 25;
            flv |= bx[tmb][lct] << 26;
            flv |= bc[tmb][lct] << 27;
            feed_lct[tmb][lct] = flv;

            flv = vl[tmb][lct] << 15;
            valid_lct[tmb][lct] = flv;

            //log_printf("tmb: %d  lct: %d  val: %08x\n", tmb+1, lct+1, feed_lct[tmb][lct]);
        }
    }


    int iter, err_cnt, ch;


    // init MPC according to Jinghua

    for (unsigned mi = 0; mi < sizeof(mpc_base)/sizeof(int); mi++)
    {
        //	  WriteRegister(0x600000, 0x6A01);
        value = 0x6a01;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x600004, 0);
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 4, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000CC, 0);
/*        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xcc, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000CC, 0x3F);
        value = 0x3f;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xcc ,&value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000CC, 0);
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xcc ,&value, cvA24_U_DATA, cvD16));

*/
        // WriteRegister(0x600006, 0xFFFF);
        value = 0xffff;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 6, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000B8, 0);
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xb8, &value, cvA24_U_DATA, cvD16));
        usleep(100);

        // 6. send IDLE from MPC
/*        // WriteRegister(0x6000B6, 0);
        value = 0;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xb6, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000B4, 0x50BC);
        value = 0x50bc;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xb4, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000BA, 0xBF);
        value = 0xbf;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xba, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000AC, 0x3002);
        value = 0x3002;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xac, &value, cvA24_U_DATA, cvD16));
        usleep(10000);


        // WriteRegister(0x6000AC, 0x3000);
        value = 0x3000;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xac, &value, cvA24_U_DATA, cvD16));
        // WriteRegister(0x6000BA, 0x30);
        value = 0x30;
        check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xba, &value, cvA24_U_DATA, cvD16));
*/
    }


    err_cnt = 0;
    for (iter = 0; iter < mpc_iterations; iter++)
    {
        if (terminating)
        {
            terminating = false;
            break;
        }
        //		printf("iteration: %d\n", iter);
        for (unsigned mi = 0; mi < sizeof(mpc_base)/sizeof(int); mi++)
        {
            //            log_printf ("programming MPC in base: %x\n", mpc_base[mi]);
            // reset fifos on MPC board
            value = 0;
            check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 4,&value, cvA24_U_DATA, cvD16));

            // reset fifos on MPC board
            value = 0;
            check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 4,&value, cvA24_U_DATA, cvD16));

            // read FIFO_A flags
            if (mpc_iterations == 1)
            {
                check_ret (CAENVME_ReadCycle(BHandle, mpc_base[mi] + 0xae, &value, cvA24_U_DATA, cvD16));
                log_printf("FIFO_A after reset: empty: %d, full: %d\n", (value >> 1)&1, value&1);
            }
            // write test patterns into tx fifo,
            // ch is TMB number here

            bzero (rlct, sizeof (rlct));

            for (i = 0; i < 127/*256*/; i++) // word loop
            {
                for (ch = 0; ch < 9; ch++) // tmb loop
                {
                    for (lct = 0; lct < 2; lct++)
                    {
                        if (i == 0) // fill first words with FEED patterns
                            //if (1)
                        {
                            rlct[mi][ch][i][lct][0] = feed_lct[ch][lct] & 0xffff;
                            rlct[mi][ch][i][lct][1] = (feed_lct[ch][lct] >> 16) & 0xffff;
                        }
                        else
                        if (i < 120) // leave last few words filled with zeros
                        {

                            // everything else with random numbers + valid flags
                            if (mpc_test_index == 2)
                            {
                                // tmb and word number
                                rlct[mi][ch][i][lct][0] = (valid_lct[ch][lct] & 0xffff) | ((ch << 8) | (i&0xff));
                                rlct[mi][ch][i][lct][1] = ((valid_lct[ch][lct] >> 16) & 0xffff) | ((ch << 8) | ((~i)&0xff));
                            }

                            if (mpc_test_index == 0)
                            {
                                // just valid bits
                                rlct[mi][ch][i][lct][0] = (valid_lct[ch][lct] & 0xffff);
                                rlct[mi][ch][i][lct][1] = ((valid_lct[ch][lct] >> 16) & 0xffff);

                                // add BC0 on clock = tmb+10
                                // for BC0 alignment tests
                                if (i == ch + 10)
                                {
                                    rlct[mi][ch][i][lct][1] |= (1 << 11);
                                }
                            }

                            if (mpc_test_index == 1)
                            {
                                // all bits set
                                rlct[mi][ch][i][lct][0] = 0xffff;
                                rlct[mi][ch][i][lct][1] = 0xffff;
                            }

                            if (mpc_test_index == 3)
                            {
                                // real randoms with valid bits ORed
                                rlct[mi][ch][i][lct][0] = (valid_lct[ch][lct] & 0xffff) | rand();
                                rlct[mi][ch][i][lct][1] = ((valid_lct[ch][lct] >> 16) & 0xffff) | rand();
                            }
                        }


                        value = rlct[mi][ch][i][lct][0]; // frame 0
                        check_ret (CAENVME_WriteCycleDfr(BHandle,mpc_base[mi] + 0x80 + ch*4 + (1-lct)*2,&value, cvA24_U_DATA, cvD16));

                        value = rlct[mi][ch][i][lct][1]; // frame 1
                        check_ret (CAENVME_WriteCycleDfr(BHandle,mpc_base[mi] + 0x80 + ch*4 + (1-lct)*2,&value, cvA24_U_DATA, cvD16));
                    }
                }
            }
        }

        // execute all deferred writes now
        check_ret (CAENVME_WriteCycleExec(BHandle, cvA24_U_DATA, cvD16));

        // read FIFO_A flags
        if (mpc_iterations == 1)
        {
            check_ret (CAENVME_ReadCycle(BHandle, mpc_base[0] + 0xae, &value, cvA24_U_DATA, cvD16));
            log_printf("FIFO_A before tx: empty: %d, full: %d\n", (value >> 1)&1, value&1);
        }

        // send patterns via links
        // inject data from fifo_a
        //        for (int mi = 0; mi < sizeof(mpc_base)/sizeof(int); mi++)
        //        {
        //            value = 0;
        //            check_ret (CAENVME_WriteCycle(BHandle,mpc_base[mi] + 0xb2, &value, cvA24_U_DATA, cvD16));
        //        }

        int fd = device_d;
        uint64_t REG_BASE = 0x40ULL; // 0x40ULL // bytes
        uint32_t REG_MEM_BASE = 0x80000; // 0xc0000  bytes
        int ch = REG_BANK_CH; // config register bank
        uint64_t val64;

        // reset spy memory address
        // form address {chamber[6], sel[2], addr[7], 3'b0}
        uint32_t saddr = REG_MEM_BASE + (ch << 12); // reset register has address 0

        val64 = 4ULL; // set reset bit
        mwrite(fd, &val64, 8, saddr);

        val64 = 0ULL; // remove reset bit
        mwrite(fd, &val64, 8, saddr);

        // enable only active fibers
//        val64 = 0xffULL;
//        saddr = REG_MEM_BASE + (ch << 12) + (11 << 3) ;
//        mwrite(fd, &val64, 8, saddr);

        // Send data from MPCs to SP (Mike's message from 10-15-2013)
        //- write C0h to FF10C4h.
        value = 0xc0;
        check_ret (CAENVME_WriteCycle(BHandle, 0xff10c4,&value, cvA24_U_DATA, cvD16));

        //	        usleep(10000);

        // read FIFO_A flags
        if (mpc_iterations == 1)
        {
            check_ret (CAENVME_ReadCycle(BHandle, mpc_base[0] + 0xae, &value, cvA24_U_DATA, cvD16));
            log_printf("FIFO_A after tx: empty: %d, full: %d\n", (value >> 1)&1, value&1);
        }


        // read spy memory address
        saddr = REG_MEM_BASE + (ch << 12) + (0x16 << 3) ;
        off_t pos = (REG_BASE << 32) + saddr;

        mread(fd, &val64, 8, pos);
        val64 &= 0x1ffULL;
        if (val64 != 0x1ffULL)
        {
            // try waiting and reading once more
            usleep (10000);
            mread(fd, &val64, 8, pos);
            val64 &= 0x1ffULL;
            if (val64 != 0x1ffULL)
            {
                log_printf ("Spy memory was not filled, address: %x\n", val64);
            }
        }


        //create dump file
        FILE* mpc_dump = fopen("mpc_dump.txt", "w");
        FILE* mpc_err = fopen("mpc_err.txt", "w");
        // read MPC fifo_b to see what's supposed to be on fibers
        // ch is fiber number
        for (unsigned mi = 0; mi < sizeof(mpc_base)/sizeof(int); mi++) // mpc loop
        {
            for (ch = 0; ch < 8; ch++) // fiber loop
            {
                //log_printf ("%02d  ", ch);
                for (i = 0; i < 254*4; i++)// 254 words * 4 frames
                {

                    // deferred read function
                    check_ret (CAENVME_ReadCycleDfr
                               (
                                   BHandle,
                                   mpc_base[mi] + 0xe4 + ch*2,
                                   &tddd[ch][i],
                                   cvA24_U_DATA, cvD16));
                    //                    check_ret (CAENVME_ReadCycle(BHandle,mpc_base[mi] + 0xe4 + ch*2,&value, cvA24_U_DATA, cvD16));

                    // store value for future comparison with SR
                    //                    tddd[ch][i] = value & 0xffff;
                    //                if (i < 25) log_printf("%04X ", value & 0xffff);
                }
                //            log_printf("\n");
            }
            //log_printf("\n\n");

            // execute all deferred reads
            check_ret (CAENVME_ReadCycleExec(BHandle, cvA24_U_DATA, cvD16));

            // ch here is fiber number

            // transfer from Core

            uint16_t mpc_fiber [8][512];//[fiber][word]
            //**********************************************************************
            read_mpc_spy_mem (mpc_fiber, 0); // read MPC data from spy memory in MTF7

            //            if (mpc_iterations == 1) // print only if single iteration
            //            {
            //                for (int i = 0; i < 256; i++)
            //                {
            //                    printf("%04X ", read_buf[i]);
            //                    if (i%8 == 7) printf("\n");
            //                }
            //            }

            int no_feed = 0;
            for (ch = 0; ch < 8; ch++) // fiber loop
            {

                // search for feed pattern in fiber data
                int fw;
                for (fw = 0; fw < 127*4; fw++)
                {
                    if (mpc_fiber[ch][fw] == 0xfeed) break;
                }
                if (fw >= 127*4)
                {
                    log_printf ("iter: %d mpc: %d fiber: %d cannot find FEED pattern\n", iter, mi, ch);
                    fw = 0;
                    no_feed = 1;
                }
                else
                {
                    if (mpc_iterations == 1)
                        log_printf ("mpc: %d fiber: %d FEED pattern word: %d\n", mi, ch, fw);
                }
                {
                    int i = 0;
                    // start from feed word in fiber data, but from 0 word in FIFO_B data
                    // 0 word in FIFO_B data contains FEED pattern
                    for (; fw < 127*4; fw++, i++) //127 words * 4 frames
                    {
                        // read into value here
                        //                    value = read_buf[i*8 + ch];
                        value = mpc_fiber[ch][fw];
                        //if (i < 9) log_printf("%04X ", value & 0xffff);


                        fprintf(mpc_dump, "iter: %d mpc: %d ch: %d  i: %d  tx: %04X  rx: %04X  err: %04X\n",
                                iter, mi, ch, i, tddd[ch][i], value & 0xffff, ((value & 0xffff) ^ tddd[ch][i]) & 0xffff);

                        // removed frame 0 bits from tests.
                        // MPC in UF FIFO_B shows one in frame 1 in this bit for some reason, but transmits 0
                        // firmware 9/22/2014
                        if ((value & 0x7fff) != (tddd[ch][i] & 0x7fff)) // compare
                        {
                            err_cnt++;
                            fprintf(mpc_err, "iter: %d mpc: %d ch: %d  i: %d  tx: %04X  rx: %04X  err: %04X\n",
                                    iter, mi, ch, i, tddd[ch][i], value & 0xffff, ((value & 0xffff) ^ tddd[ch][i]) & 0xffff);
                            /*                    if (err_cnt > 32)
                            {
                                fflush(mpc_dump);
                                fflush(mpc_err);
                                fclose (mpc_dump);
                                fclose (mpc_err);

                                goto break_out1;
                            }
                            */
                        }

                    }
                }
                //log_printf("\n");
            }
            if (no_feed) goto eject;
        }
        fflush(mpc_dump);
        fflush(mpc_err);


        fclose (mpc_dump);
        fclose (mpc_err);

        set_progress(iter*100/mpc_iterations);
        if (err_cnt > 0) break;

    }

    set_progress(100);

eject:

    log_printf("\nerror count: %d\n", err_cnt);

    CAENVME_End(BHandle);
    free(read_buf);


}

int prbs_mpc_enable(int prbs_type)
{
	int32_t BHandle;

	if( CAENVME_Init(/*VMEBoard*/cvV2718, /*Link*/0, /*Device*/0, &BHandle) != cvSuccess )
	{
		log_printf("\n\n Error opening VME controller driver\n");
		return 1;
	}


	// enable PRBS on MPC

	for (unsigned i = 0; i < sizeof(mpc_base)/sizeof(int); i++)
	{
		// MPC GTP initialization
		uint32_t value = 0x3f;
		check_ret(CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xba, &value, cvA24_U_DATA, cvD16));
		// write PRBS pattern into CSR4 register on MPC

		value = prbs_type << 4; // prbs_type should be from 0 to 7

		log_printf("type: %d value: %x\n", prbs_type, value);
		check_ret(CAENVME_WriteCycle(BHandle,mpc_base[i] + 0xb8, &value, cvA24_U_DATA, cvD16));

		//program CSR0 of MPC to enable RPBS on TLK transmitters
		value = 0xe201;
		check_ret (CAENVME_WriteCycle(BHandle,mpc_base[i],&value, cvA24_U_DATA, cvD16));

	}

	CAENVME_End(BHandle);

	log_printf("Enabled PRBS TX on MPC (via VME controller)\n");
	return 0;
}


uint64_t read_link_ids(int endcap, int sector)
{
	int fd = device_d;
	uint64_t value;
	uint64_t link_id[10], cppf_lid;
	uint64_t saddr;
	off_t pos;

	log_printf("reading link IDs\n");

	// module addresses
	uint32_t MEM_BASE = 0x80000; // 0xc0000  bytes
	uint64_t REG_BASE = 0x40ULL; // 0x60ULL  bytes


	int ch = REG_BANK_CH; // config register bank

	// form start address {chamber[6], sel[2], addr[7], 3'b0}
	saddr = MEM_BASE + (ch << 12) + (1 << 3) ;

	// read all ID registers. Size is in bytes
	pos = (REG_BASE << 32) + saddr;
	mread(fd, link_id, 80, pos);

	saddr = MEM_BASE + (ch << 12) + (0x51 << 3) ;

	mread(fd, &cppf_lid, 8, saddr); // cppf link ids


	unsigned st = 0, fb = 0; // station and fiber
	unsigned lid[5][8], lidn[9];

	// registers from 0 to 5 are filled identically, 6 10-bit IDs per register
	for (unsigned i = 0; i < 6; i++) // register loop
	{
		for (unsigned j = 0; j < 6; j++) // id loop
		{
			lid[st][fb] = (link_id[i] >> (j*10)) & 0x3ff;
			fb++; // next fiber
			if (fb == 8) 
			{
				st++; // next station
				fb = 0;
			}
		}
	}

	// register 6 contains only 4 IDs
	for (unsigned j = 0; j < 4; j++) // id loop
	{
		lid[st][fb] = (link_id[6] >> (j*10)) & 0x3ff;
		fb++; // next fiber
		if (fb == 8) 
		{
			st++; // next station
			fb = 0;
		}
	}

	// register 7 contains first 6 of neighbor sector IDs
	fb = 0;
	for (unsigned j = 0; j < 6; j++) // id loop
	{
		lidn[fb] = (link_id[7] >> (j*10)) & 0x3ff;
		fb++; // next fiber
	}
	// register 8 contains the remaining 3 neighbor sector IDs
	for (unsigned j = 0; j < 3; j++) // id loop
	{
		lidn[fb] = (link_id[8] >> (j*10)) & 0x3ff;
		fb++; // next fiber
	}

	// expected link IDs [endcap][sector][station]
	// all numbers have 0 added for fiber ID addition later
	int exp_lid [2][12][5] =
	{ 
		{
			{0x020, 0x030, 0x0d0, 0x130, 0x190},
			{0x040, 0x050, 0x0e0, 0x140, 0x1a0},
			{0x060, 0x070, 0x0f0, 0x150, 0x1b0},
			{0x080, 0x090, 0x100, 0x160, 0x1c0},
			{0x0a0, 0x0b0, 0x110, 0x170, 0x1d0},
			{0x0c0, 0x010, 0x120, 0x180, 0x1e0},
		},             	      	     	    
		{              	      	     	    
			{0x200, 0x210, 0x2b0, 0x310, 0x370},
			{0x220, 0x230, 0x2c0, 0x320, 0x380},
			{0x240, 0x250, 0x2d0, 0x330, 0x390},
			{0x260, 0x270, 0x2e0, 0x340, 0x3a0},
			{0x280, 0x290, 0x2f0, 0x350, 0x3b0},
			{0x2a0, 0x1f0, 0x300, 0x360, 0x3c0}
		}
	};
	
	// reading ge11 link ids
	uint32_t ge11_id_addr = MEM_BASE + (ch << 12) + (0x6e << 3) ;

	uint64_t ge11_lid;
	mread(fd, &ge11_lid, 8, ge11_id_addr); // ge11 link ids
	log_printf ("GE11 link IDs: ");
	for (unsigned i = 0; i < 7; i++) // link loop, 7 links
	{
		uint8_t ge11_idi = (uint8_t)ge11_lid;
		ge11_lid >>= 8;
		log_printf ("%02x ", ge11_idi);
	}
	log_printf ("\n");

	// reading ge11 link status
	uint32_t ge11_id_stat = MEM_BASE + (ch << 12) + (0x6f << 3) ;
	uint64_t ge11_stat;
	mread(fd, &ge11_stat, 8, ge11_id_stat);

	uint8_t ge11_locked = (uint8_t)ge11_stat;
	log_printf ("GE11 locked: %02x\n", ge11_locked);

	uint64_t fib_en_mask = 0x1ffffffffffffULL; // fiber enable mask, all

	int fi = 0; // fiber en mask index
	for (unsigned i = 0; i < 5; i++) // station
	{
		//log_printf ("st: %d link IDs: ", i);
		for (unsigned j = 0; j < 8; j++) // fiber loop
		{
			int mpc_id = lid[i][j] & 0x3f0;
			unsigned fib_id = lid[i][j] & 0xf;
			if ((mpc_id != exp_lid[endcap-1][sector-1][i]) || (fib_id != (j + 1)))
			{
				log_printf ("Link  ID error: endcap: %d sector: %d station: %d chamber: %d LID: %03x, expected: %03x \n", 
						endcap, sector, i, j+2, lid[i][j], exp_lid[endcap-1][sector-1][i] + j+1);
				uint64_t dis_fib = 1;
				dis_fib = dis_fib << fi;
				fib_en_mask &= ~dis_fib; // remove this fiber from mask
			}
			fi++;
			//log_printf ("%03x ", lid[i][j]);
		}
		//log_printf("\n");
	}

	log_printf ("fiber mask: %016llx\n", fib_en_mask);

	log_printf ("st: N link IDs: ");
	for (unsigned j = 0; j < 9; j++) // id loop
	{
		log_printf ("%03x ", lidn[j]);
	}
	log_printf("\n");

	log_printf ("CPPF IDs: ");
	for (unsigned j = 0; j < 7; j++) // cppf ID loop
	{
		int cppfid = (cppf_lid >> (8*j)) & 0xff; // isolate one ID
		int cppf_z = (cppfid >> 6) & 3; // endcap
		int cppf_s = (cppfid >> 3) & 7; // subsector
		int cppf_l = cppfid & 7; // link
		log_printf ("%d%d%d  ", cppf_z, cppf_s, cppf_l);
	}
	log_printf ("\n");
	int cppf_crc_match = (cppf_lid >> (8*7)) & 0x7f; // CPPF crc match flags

	log_printf("CPPF CRC match: %02x\n", cppf_crc_match);


	log_printf("read fiber enable flags\n");

	// form address {chamber[6], sel[2], addr[7], 3'b0}
	saddr = MEM_BASE + (ch << 12) + (11 << 3) ;

	// read register. Size is in bytes
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);

	log_printf ("fiber enable: %016llx\n", value);

	log_printf ("read bc0 alignment counters\n");

	bad_alignment = 0;
	unsigned i, j;
	uint32_t cnt;


	for ( i = 0; i < 5; i++) // MPC loop
	{
		// form address {chamber[6], sel[2], addr[7], 3'b0}
		saddr = MEM_BASE + (ch << 12) + ((i+12) << 3) ;

		// read register. Size is in bytes
		//        off_t pos = (REG_BASE << 32) + saddr;
		mread(fd, &value, 8, saddr);

		//        log_printf ("bc0 counters #%02d: %016llx\n", i, value);

		// see if any of the counters is out of bounds
		log_printf ("bc0 counters %d: ", i);
		for ( j = 0; j < 8; j++) // fiber loop
		{
			cnt = (value >> (j*8)) & 0xff;
			if (cnt > 0x20) // bad alignment counter, fiber probably missing BC0
			{
				bad_alignment |= (1ULL << (i*8+j)); // update bad alignment flag for that fiber
			}
			log_printf ("%02x ", cnt);
		}
		log_printf ("\n");
	}

	// read neighbor sector counters
	log_printf ("bc0 counters N: ");
	saddr = MEM_BASE + (ch << 12) + (10 << 3) ;
	mread(fd, &value, 8, saddr);
	i = 5; // call neighbor sector station 5
	for ( j = 0; j < 8; j++) // fiber loop
	{
		cnt = (value >> (j*8)) & 0xff;
		if (cnt > 0x20) // bad alignment counter, fiber probably missing BC0
		{
			bad_alignment |= (1ULL << (i*8+j)); // update bad alignment flag for that fiber
		}
		log_printf ("%02x ", cnt);
	}


	saddr = MEM_BASE + (ch << 12) + (9 << 3) ;
	mread(fd, &value, 8, saddr);
	j = 8; // read last fiber from register 9
	cnt = (value >> 30) & 0xff;
	if (cnt > 0x20) // bad alignment counter, fiber probably missing BC0
	{
		bad_alignment |= (1ULL << (i*8+j)); // update bad alignment flag for that fiber
	}
	log_printf ("%02x\n", cnt);



	log_printf ("bad_alignment : %016llx\n", bad_alignment);

	saddr = MEM_BASE + (ch << 12) + (17 << 3) ;
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);
	log_printf ("DAQdelay register:     %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (18 << 3) ;
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);
	log_printf ("BC0 period errors:     %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (19 << 3) ;
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);
	log_printf ("BC0 stuck errors:      %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (20 << 3) ;
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);
	log_printf ("BC0 chamber 0 errors:  %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x61 << 3) ;
	mread(fd, &value, 8, saddr);
	log_printf ("CRC errors          :  %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x62 << 3) ;
	mread(fd, &value, 8, saddr);
	log_printf ("Test pattern errors :  %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x70 << 3) ;
	mread(fd, &value, 8, saddr);
	log_printf ("GE1/1 errors [3:0]  :  %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x71 << 3) ;
	mread(fd, &value, 8, saddr);
	log_printf ("GE1/1 errors [6:4]  :  %016llx\n", value);

	// reset error flags
	saddr = MEM_BASE + (ch << 12) ;
	mread  (fd, &value, 8, saddr);
	value |= (1ULL << 21);
	mwrite (fd, &value, 8, saddr);
	value &= ~(1ULL << 21);
	mwrite (fd, &value, 8, saddr);

	saddr = MEM_BASE + (ch << 12) + (21 << 3) ;
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);
	log_printf ("Byte alignment status: %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x16 << 3) ;
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);
	log_printf ("Spy memory address:    %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x32 << 3) ;
	mread(fd, &value, 8, saddr);
	log_printf ("Core config:           %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x56 << 3) ;
	mread(fd, &value, 8, saddr);
	log_printf ("HR timeouts:           %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0 << 3) ;
	mread(fd, &value, 8, saddr);
	log_printf ("Control register:      %016llx\n", value);

	saddr = MEM_BASE + (ch << 12) + (0x17 << 3) ;
	pos = (REG_BASE << 32) + saddr;
	mread(fd, &value, 8, pos);

	uint32_t abs_time = value & 0xffffffffULL;
	uint32_t pll_cnt = (value >> 32) & 0xffffffffULL;

	uint32_t diff = abs_time - pll_cnt;
	log_printf ("Core    FPGA clk cnt diff: %x abs: %x pll: %x\n", diff, abs_time, pll_cnt);

	static struct timeval t0, t1;

	t0.tv_sec = t1.tv_sec;
	t0.tv_usec = t1.tv_usec;

	static uint32_t control_lhc_cnt, control_pll_cnt;
	static uint32_t control_lhc_cnt_0, control_pll_cnt_0, control_lock_status;
	control_lhc_cnt_0 = control_lhc_cnt;
	control_pll_cnt_0 = control_pll_cnt;
	gettimeofday(&t1, NULL);
	mread (fd, &control_lock_status, 4, 0xc); // read PLL status from control FPGA
	log_printf ("lock status: %08llx, clk_in: %x hold: %x lock: %d\n",
			control_lock_status, (control_lock_status >> 18)&1, (control_lock_status >> 17)&1, (control_lock_status >> 16) &1);
	uint32_t hard_reset_cnt = (control_lock_status >> 19) & 0x1fff;
	log_printf ("Hard Reset count: %d\n", hard_reset_cnt);


	mread (fd, &control_lhc_cnt, 4, 0x14); // read LHC clock counter from Control FPGA
	mread (fd, &control_pll_cnt, 4, 0x18); // read PLL clock counter from Control FPGA
	// calculate difference, it should stay constant
	// last couple of bits may be oscillating though because if different clock domains
	diff = control_lhc_cnt - control_pll_cnt;

	// calculate clock frequencies
	int64_t control_lhc_diff = ((int64_t)control_lhc_cnt) - ((int64_t)control_lhc_cnt_0);
	int64_t control_pll_diff = ((int64_t)control_pll_cnt) - ((int64_t)control_pll_cnt_0);
	float wloop_time = ((t1.tv_sec+t1.tv_usec/1000000.) - (t0.tv_sec+t0.tv_usec/1000000.));
	float f_lhc = (float)control_lhc_diff / wloop_time / 1000000.;
	float f_pll = (float)control_pll_diff / wloop_time / 1000000.;

	log_printf ("Control FPGA clk cnt diff: %x lhc: %x pll: %x\n",
			diff, control_lhc_cnt, control_pll_cnt);
	log_printf ("time: %f, LHC d: %llu, PLL d: %llu F LHC: %f, F PLL: %f\n",
			wloop_time, control_lhc_diff, control_pll_diff, f_lhc, f_pll);

	uint32_t bc0_cnt, resync_cnt;
	mread(fd, &bc0_cnt, 4, 0x10);
	resync_cnt = (bc0_cnt >> 12) & 0xfffff;
	bc0_cnt &= 0xfff;
	log_printf ("bc0 period: %d\n", bc0_cnt);
	log_printf ("resync cnt: %d\n", resync_cnt);


	mread(fd, &value, 8, 0xB62A8); // main MMCM unlock counter
	log_printf ("MMCM unlocks: %08llx\n", value);

	return fib_en_mask;
}

