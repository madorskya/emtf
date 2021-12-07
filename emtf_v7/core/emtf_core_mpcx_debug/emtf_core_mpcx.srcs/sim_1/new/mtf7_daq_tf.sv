`include "vppc_macros.sv"
`include "spbits.sv"

`include "interfaces.sv"

module mtf7_daq_tf;
   /*
    in 2015 code, the station inputs include chambers from neighbor sector. the layout is as follows:
    index 0:       station 1A     = 9 chambers + 3 chambers from neighbor sector, total = 12 chambers
    index 1:       station 1B     = 9 chambers only, no neighbor
    indexes 2,3,4: stations 2,3,4 = 9 chambers + 2 chambers from neighbor sector, total 11 chambers

    current code:
    All neighbor sector chambers are dumped into index 5, and there's 9 of them.
    So we have 6 indexes, 9 chambers in each
    */
   // using csc_lct struct
   // csc_lct {
   //   .ql, replace qN
   //   .wg, replace wgN
   //   .hs, replace hstrN
   //   .cp, replace cpatN
   //   .lr,
   //   .vf
   // }

   // * first index assignments:
   //   0: ME1/1a
   //   1: ME1/1b
   //   2: ME2/1
   //   3: ME3/1
   //   4: ME4/1
   //   5: neighbor
   // * second index
   //   9 chambers total
   // * third index
  `localpar N_GE11_LAY     = 2;   ///< Number of layers in the GE1/1 superchamber
  `localpar GEM_CLS_PER_BX = 8;   ///< 8 clusters per BX in GEM transmitted frame


   csc_lct_mpcx          lct_i [5:0][8:0][seg_ch-1:0];

   reg [48:0]       bc0_err_period;
   reg [4:0]        bc0_err_period_id1;

   // RPC inputs
   reg [63:0]       cppf_rxd [6:0][2:0]; // cppf rx data, 3 frames x 64 bit, for 7 links
   reg [6:0]        cppf_rx_valid;       // cprx data valid flags
   reg [6:0]        cppf_crc_match;      // CRC match flags from CPPF links

   // GEM inputs
   reg [233:0]      gem_rxd [6:0];      // GEM rx data, 1 frame x 234 bit, for 7 links
   reg [6:0]        gem_rx_valid;       // GEM rx data valid flags
   reg [6:0]        gem_crc_match;      // CRC match flags from GEM links


   // precise phi and theta of best tracks
   // [best_track_num]
   reg [8:0]        bt_pt [2:0];
   reg [bw_fph-1:0] bt_phi [2:0];
   // ranks [best_track_num]
   reg [bwr:0]      bt_rank [2:0];
   // segment IDs
   // [best_track_num][station 0-3]
   reg [seg_ch-1:0] bt_vi [2:0][4:0]; // valid
   reg [1:0]        bt_hi [2:0][4:0]; // BX index
   reg [3:0]        bt_ci [2:0][4:0]; // chamber
   reg [4:0]        bt_si [2:0];      // segment
   reg [29:0]       ptlut_addr [2:0]; // pT LUT address
   reg [7:0]        gmt_phi [2:0];    // GMT phi
   reg [8:0]        gmt_eta [2:0];    // GMT eta
   reg [3:0]        gmt_qlt [2:0];    // GMT qlt
   reg [2:0]        gmt_crg ;    // GMT charge

   // clock
   reg              clk;

   reg [63:0]       daq_config;

   reg              l1a_in;
   reg              ttc_resync;
   reg              ttc_bc0;
   reg              ttc_ev_cnt_reset;
   reg              ttc_or_cnt_reset;

   wire [63:0]      daq_data;
   wire             daq_valid;
   wire             daq_first;
   wire             daq_last;
   wire             clk_80;
   reg              amc13_ready;
   wire [7:0]       amc13_to_counter = 8'h0;
   wire [3:0]       tts_data;

   reg [4:0]        sp_addr; // uTCA slot number
   reg [3:0]        sp_ts;   // Trigger sector ME+ = 1..6, ME- = 7..12

   reg              reset;
   wire [63:0]      daq_state_cnt;
   wire             resync_and_empty;
   reg [31:0]       fw_date;

   reg [7:0]        af_delays [48:0];

   wire [15:0]      orbit_count;
   reg  [11:0]      bxn_counter;
   wire [23:0]      l1a_count;
   reg              force_oos;
   reg [63:0]       fiber_enable;
   reg [17:0]       nn_pt [2:0] = '{18'h333, 18'h222, 18'h111}; // pt generated by NN
   reg  [2:0]       nn_pt_v = 3'b111; // NN pt valid flags
    reg [11:0] zero12;
    reg d15a, d15b, d15c;
    reg [1:0] zero2;
    reg [7:0] zero8;


   mtf7_daq uut
   (
      // chamber data
      .lct_i              (lct_i),

      .bc0_err_period     (bc0_err_period),
      .bc0_err_period_id1 (bc0_err_period_id1),
      .cppf_rxd           (cppf_rxd),
      .cppf_rx_valid      (cppf_rx_valid),
      .fiber_enable       (fiber_enable),
      .cppf_crc_match     (cppf_crc_match),

      .gem_rxd           (gem_rxd),
      .gem_rx_valid      (gem_rx_valid),
      .gem_crc_match     (gem_crc_match),


      // tracks
      .bt_pt            (bt_pt),
      .bt_phi           (bt_phi),

      .bt_rank          (bt_rank),


      .bt_vi            (bt_vi),
      .bt_hi            (bt_hi),
      .bt_ci            (bt_ci),
      .bt_si            (bt_si),
      .ptlut_addr       (ptlut_addr),
      .nn_pt            (nn_pt), // pt generated by NN
      .nn_pt_v          (nn_pt_v), // NN pt valid flags

      .gmt_phi          (gmt_phi),
      .gmt_eta          (gmt_eta),
      .gmt_qlt          (gmt_qlt),
      .gmt_crg          (gmt_crg),


      .clk              (clk),

      .daq_config       (daq_config),

      .l1a_in           (l1a_in),
      .ttc_resync       (ttc_resync),
      .ttc_bc0          (ttc_bc0),
      .ttc_ev_cnt_reset (ttc_ev_cnt_reset),
      .ttc_or_cnt_reset (ttc_or_cnt_reset),

      .daq_data         (daq_data),
      .daq_valid        (daq_valid),
      .daq_first        (daq_first),
      .daq_last         (daq_last),
      .clk_80           (clk_80),
      .amc13_ready      (amc13_ready),
      .amc13_to_counter (amc13_to_counter),
      .tts_data         (tts_data),

      .sp_addr          (sp_addr),
      .sp_ts            (sp_ts),

      .reset            (reset),
      .daq_state_cnt    (daq_state_cnt),
      .resync_and_empty (resync_and_empty),
      .fw_date          (fw_date),

      .af_delays        (af_delays),

      .orbit_count      (orbit_count),
      .bxn_counter      (bxn_counter),
      .l1a_count        (l1a_count),
      .force_oos        (force_oos)
   );

   integer n, c;
   integer i, station_, bnk;
   integer j,k,l;
   integer all_wc_int = 0;

   reg [15:0]                   rpc_fr_wd [6:0][2:0][3:0]; //
   reg [10:0]                   rpc_ph; //
   reg [4:0]                    rpc_th; //

   reg [9:0]                    gem_head; //
   reg [13:0]                   gem_clu_d[1:0][7:0];
   reg [3:0]                    gem_v_hits[1:0]; //
   reg [2:0]                    gem_clu_sz;
   reg [2:0]                    gem_clu_par;
   reg [7:0]                    gem_clu_pad;

   reg [2:0]  daq_gem_clu_sz;
   reg [2:0]  daq_gem_clu_par;
   reg [8:0]  daq_gem_clu_pad;
   reg [2:0]  daq_gem_link;
   reg [3:0]  daq_gem_cluster_num;
   reg        daq_gem_bc0;
   reg [11:0] daq_gem_bxn;
   reg        daq_gem_vp;
   reg [2:0]  daq_gem_tbin;
   
   // since most of the DAQ logic runs at 80 MHz, have to print based on doubled clock inside the module
   always @(negedge uut.clk_80)
   begin
            if ((daq_data & 64'hf000_f000_f000_f000) == 64'hf000_f000_f000_f000) // trailer
            begin
                $write ("trailer: %h\n", daq_data);
//                for (k = 0; k < 112; k++)
//                begin
//                    $write ("gem_data[0][%03d] = %016h\n", k, uut.gem_data[0][k]);
//                end
            end
            
            if ((daq_data & 64'h8000_8000_8000_8000) == 64'h0000_8000_8000_8000) // GEM data block
            begin
//                $write ("GEM data: %h mewc: %04d n: %04d\n", daq_data, uut.mewc, n);

                // decode
                {
                   zero12,
                   daq_gem_vp,
                   daq_gem_tbin,
                   
                   d15c,
                   daq_gem_bc0,
                   zero2,
                   daq_gem_bxn,
                   
                   d15b,
                   daq_gem_link,
                   daq_gem_cluster_num,
                   zero8,
                   
                   d15a,
                   daq_gem_clu_sz ,
                   daq_gem_clu_par,
                   daq_gem_clu_pad

                } = daq_data;
               
                $write ("vp: %b tbin: %h bc0: %b bxn: %h link: %h cln: %h cls: %h, prt: %h str: %02h\n",
                   daq_gem_vp,
                   daq_gem_tbin,
                   
                   daq_gem_bc0,
                   daq_gem_bxn,
                   
                   daq_gem_link,
                   daq_gem_cluster_num,
                   
                   daq_gem_clu_sz ,
                   daq_gem_clu_par,
                   daq_gem_clu_pad
                );
            end
    end

    integer nc;

   initial
   begin
      bc0_err_period     = 49'h0;
      bc0_err_period_id1 = 5'h0;

      cppf_rx_valid  = 6'h7f;
      cppf_crc_match = 6'h7f;

      gem_rx_valid  = 6'h7f;
      gem_crc_match = 6'h7f;

      fiber_enable = 63'h7fff_ffff_ffff_ffff;

      daq_config = {
                    3'h0,        // gem_late_by_bxs, by how many BXs GEM data is late relative to CSC
                    3'h2,        // rpc_late_by_bxs, by how many BXs RPC data is late relative to CSC
                    1'b0,        // report_wo_track, if =1 DAQ will report events that don't contain valid tracks but contain LCTs
                    1'b1,        // amc13_easy_en, enable reducing payload if AMC13 gets full
                    1'b1,        // stress, stress test mode
                    16'hbeef,    // board_id,
                    12'ha,       // bxn_offset,
                    3'h2,        // valor_window
                    8'h3,        // valor_delay
                    3'h7,        // l1a_window, how many BXs to report on each L1A
                    8'h1         // l1a_delay
                    };

        l1a_in           = 0;
        ttc_resync       = 0;
        ttc_bc0          = 0;
        ttc_ev_cnt_reset = 0;
        ttc_or_cnt_reset = 0;
        amc13_ready      = 1;

        sp_addr = 5;  // slot
        sp_ts   = 12; // trigger sector

        reset   = 0;
        fw_date = {
                   5'd8,
                   4'd6,
                   6'd20,
                   5'd16,
                   6'd45,
                   6'd25
                   };

        for (i = 0; i < 49; ++i)
        begin
           af_delays[i] = 8'h0;
        end

        force_oos = 0;

        for (n = 0; n < 5000; ++n)
        begin
           // moved clock to top of for loop
           for (c = 0; c < 2; ++c)
           begin
              `clk_drive(clk, c);
              `__top_module__
           end

           // bxn_counter = bxn_counter + 1;

           if (n < 2) reset = 1;
           else       reset = 0;

           if (n == 137) force_oos = 1;
           else force_oos = 0;

           if (n == 8 || n == 28) bt_rank[0] = 1;
           else bt_rank[0] = 0;

           // drive a BC0 every orbit;
           if (n == 3) ttc_bc0 = 1;
           else        ttc_bc0 = 0;

           if (n == 2 || n == 145) ttc_resync = 1;
           else                    ttc_resync = 0;

           if (n == 3) ttc_or_cnt_reset = 1;
           else        ttc_or_cnt_reset = 0;

           if (n == 3) ttc_ev_cnt_reset = 1;
           else        ttc_ev_cnt_reset = 0;

           l1a_in = 0;
           // if (n == 18 || n == 38) l1a_in = 1; // valid track
           // if (n == 25 || n == 27) l1a_in = 1; // no track
           // if (n == 38) l1a_in = 1;            // valid track
           // if (n == 63 || n == 75) l1a_in = 1; // valid track
           // if (n == 117 || n == 128 || n == 147 || n == 172 || n == 198) l1a_in = 1; // valid track
           // if (n == 207 || n == 241) l1a_in = 1; // valid track
           if (n == 100 || n == 134 || n == 178 || n == 283 || n == 285) l1a_in = 1;            // valid track

           // best track loop
           ptlut_addr[0] = {12'hfee,2'h0,16'hcafe};
           ptlut_addr[1] = {12'hdea,2'h0,16'hf00d};
           ptlut_addr[2] = {12'hcaf,2'h0,16'hbeef};

           for (j = 0; j < 3; ++j) 
           begin
              bt_pt[j]  = 2*n;
              bt_phi[j] = n;

              if (j == 0 && (n == 8 || n == 28)) bt_rank[j] = 1;
              else                               bt_rank[j] = 0;

              for (i = 0; i < 5; ++i)
              begin
                 bt_vi[j][i] = 1;
                 bt_hi[j][i] = n;
                 bt_ci[j][i] = j+i;
              end
              bt_si[j]   = j+i;

              gmt_phi[j] = n;
              gmt_eta[j] = n+j;
              gmt_qlt[j] = j;
              if (j == 0) gmt_crg[j] = 0;
              else        gmt_crg[j] = 1;

           end

           // CSC BLOCK
           // station loop
           for (l = 0; l < 6; ++l) 
           begin
              // chamber loop
              for (j = 0; j < 9; ++j) 
              begin
                 // segment loop
                 for (k = 0; k < seg_ch; ++k) 
                 begin
                    lct_i[l][j][k].vf = 1;
                    lct_i[l][j][k].lr = k;
                    lct_i[l][j][k].ql = l; // station id (0,1,2,3,4)
                    lct_i[l][j][k].wg = j;
                    if (l == 1) lct_i[l][j][k].hs = n+1; // n, or n+1 for me1/1b
                    else lct_i[l][j][k].hs = n; // n, or n+1 for me1/1b
                    lct_i[l][j][k].cp = k;
                 end
              end
           end

           // RPC BLOCK
           // station loop
           for (l = 0; l < 7; ++l) 
           begin
              // frame loop
              for (j = 0; j < 3; ++j) 
              begin
                 // word/hit loop
                 for (k = 0; k < 4; ++k) 
                 begin
                    // fill the fake data?
                    rpc_ph = l+j+k; // phi max is 6+2+3=11 (4 bits)
                    rpc_th = l+k;   // theta max is 6+3=9 (4 bits)
                    rpc_fr_wd[l][j][k] = {4'he,
                                          rpc_ph,
                                          4'hd,
                                          rpc_th
                                          };
                 end
                 cppf_rxd[l][j] = {
                                   // 16 words per link
                                   rpc_fr_wd[l][j][0],
                                   rpc_fr_wd[l][j][1],
                                   rpc_fr_wd[l][j][2],
                                   rpc_fr_wd[l][j][3]
                                   };
              end
           end

           // GEM BLOCK
           // station loop
           nc = 0;
           for (l = 0; l < 7; ++l) 
           begin
              gem_v_hits[0] = l;
              gem_v_hits[1] = l;
              gem_head = {gem_v_hits[1], gem_v_hits[0], 1'b0, 1'b1};
              // layer loop
              for (j = 0; j < N_GE11_LAY; ++j) 
              begin
                 // cluster loop
                 for (k = 0; k < GEM_CLS_PER_BX; ++k) 
                 begin
                    gem_clu_sz  = l;
                    gem_clu_par = k;
                    gem_clu_pad = nc % 12 == 0 ? n[7:0] : 255;

                    gem_clu_d[j][k] = {gem_clu_sz,
                                       gem_clu_par,
                                       gem_clu_pad
                                      };
                    nc++;
                 end
              end
              gem_rxd[l] = 
              {
                    gem_clu_d[1][7],
                    gem_clu_d[1][6],
                    gem_clu_d[1][5],
                    gem_clu_d[1][4],
                    gem_clu_d[1][3],
                    gem_clu_d[1][2],
                    gem_clu_d[1][1],
                    gem_clu_d[1][0],
                    gem_clu_d[0][7],
                    gem_clu_d[0][6],
                    gem_clu_d[0][5],
                    gem_clu_d[0][4],
                    gem_clu_d[0][3],
                    gem_clu_d[0][2],
                    gem_clu_d[0][1],
                    gem_clu_d[0][0],
                    gem_head
              };
           end



//                $write ("gem_rxd[0]    = %59h\n", gem_rxd[0]);
//                $write ("daq_bnk[4][0] = %59h\n", uut.daq_bank[4][4490+234*0 +: 234]);
//                $write ("daq_bnk[4][1] = %59h\n", uut.daq_bank[4][4490+234*1 +: 234]);
//                $write ("daq_bnk[4][2] = %59h\n", uut.daq_bank[4][4490+234*2 +: 234]);
//                $write ("daq_bnk[4][3] = %59h\n", uut.daq_bank[4][4490+234*3 +: 234]);
//                $write ("daq_bnk[4][4] = %59h\n", uut.daq_bank[4][4490+234*4 +: 234]);
//                $write ("daq_bnk[4][5] = %59h\n", uut.daq_bank[4][4490+234*5 +: 234]);
//                $write ("daq_bnk[4][6] = %59h\n", uut.daq_bank[4][4490+234*6 +: 234]);

//                for (bnk = 0; bnk < 8; bnk++)
//                begin
//                  for (station_ = 0; station_ < 3'd7; station_ = station_+1) // GEM sub-sector loop
//                  begin
//                    $write ("link: %d n0: %h n1: %h ", station_, uut.gem_n_clu_d[bnk][station_][0], uut.gem_n_clu_d[bnk][station_][1]);
//                    for (j = 0; j < N_GE11_LAY; j = j+1) // superchamber/stack layer?
//                    begin
//                        for (k = 0; k < GEM_CLS_PER_BX; k = k+1) // cluster in layer loop
//                        begin

//                            $write ("zps: %h %h %h ",
//                                uut.gem_clu_sz_d[bnk][station_][j][k],
//                                uut.gem_par_d   [bnk][station_][j][k],
//                                uut.gem_str_d   [bnk][station_][j][k]
//                            ); 

//                        end
//                    end
//                    $write ("\n");
//                  end
//                end

        end
   end

endmodule
