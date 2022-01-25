`include "vppc_macros.sv"

module ptlut_address
(
    bt_phi_i,
    bt_theta_i,
    bt_cpattern,
    bt_lr,
    bt_delta_ph,
    bt_delta_th,
    bt_sign_ph,
    bt_sign_th,
    bt_rank_i,
    bt_vi, 
    bt_hi, 
    bt_ci, 
    bt_si,

    vl_single,
    ph_single,
    th_single,
    cpat_single,
    
    ptlut_addr,
    ptlut_cs,
    ptlut_addr_val,
    bt_rank_o,
    
    gmt_phi,
    gmt_eta,
    gmt_qlt,
    gmt_crg,
        
    sector,
    endcap,
    
    low_th_promote,
    
    clk

);

`include "spbits.sv"

	// precise phi and theta of best tracks
	// [best_track_num]
	input [bw_fph-1:0] bt_phi_i [2:0];
	input [bw_th-1:0] 	bt_theta_i [2:0];
	// [best_track_num][station 0-3]
	input [3:0] 		bt_cpattern [2:0][3:0];
	input [3:0] 		bt_lr [2:0];
	// ph and th deltas from best stations
	// [best_track_num], last index: 0=12, 1=13, 2=14, 3=23, 4=24, 5=34
	input [bw_fph-1:0] bt_delta_ph [2:0][5:0];
	input [bw_th-1:0] 	bt_delta_th [2:0][5:0]; 
	input [5:0] 		bt_sign_ph[2:0];
	input [5:0] 		bt_sign_th[2:0];
	// ranks [best_track_num]
	input [bwr:0] 		bt_rank_i [2:0];
	//[best_track_num][station 0-4]
	input [seg_ch-1:0] bt_vi [2:0][4:0]; // valid
	input [1:0] 		bt_hi [2:0][4:0]; // bx index
	input [3:0] 		bt_ci [2:0][4:0]; // chamber
	input [4:0]		bt_si [2:0]; // segment
	
    input vl_single;
    input [bw_fph-1:0] ph_single;
    input [bw_th-1:0] th_single;
    input [3:0] cpat_single;

	output reg [29:0] ptlut_addr [2:0];
	output reg [31:0] ptlut_cs [2:0];
	output reg [2:0] ptlut_addr_val;
	output [bwr:0] 	 bt_rank_o [2:0];
	
	output reg [7:0] gmt_phi [2:0];
	output reg [8:0] gmt_eta [2:0];
	output reg [3:0] gmt_qlt [2:0];
	output reg [2:0] gmt_crg;
	
	input [2:0] sector;
	input endcap;
	input low_th_promote;
	
	input clk;

    integer i, j;
    
	reg [bw_fph-1:0] bt_phi [2:0];
    reg [bw_th-1:0]  bt_theta [2:0];
    reg [bwr:0]      bt_rank [2:0];


    reg [8:0] th_eta0 [127:0];
    reg [8:0] th_eta1 [127:0];
    reg [8:0] th_eta2 [127:0];
    // fill theta to eta conversion LUT
    initial
    begin
        $readmemh("gmt_eta.mem", th_eta0); 
        $readmemh("gmt_eta.mem", th_eta1); 
        $readmemh("gmt_eta.mem", th_eta2); 
        // source: th-to-eta.xlsx
    end
    
    
    reg [2:0] stA, stB, stC;
    reg [2:0] bt_stA, bt_stB;
    reg [2:0] dA, dB, dC, dT;
    
    // phi compression LUTs
    reg [5:0] phi_4b_0 [511:0];
    reg [5:0] phi_4b_1 [511:0];
    reg [5:0] phi_4b_2 [511:0];
    
    reg [4:0] phi_5b_0 [511:0];
    reg [4:0] phi_5b_1 [511:0];
    reg [4:0] phi_5b_2 [511:0];
    
    reg [6:0] phi_7b_0 [511:0];
    reg [6:0] phi_7b_1 [511:0];
    reg [6:0] phi_7b_2 [511:0];
    
    reg [8:0] dphi_4bits [2:0];
    reg [8:0] dphi_5bits [2:0];
    reg [8:0] dphi_7bits [2:0];
    
    reg [2:0] m15_theta_ring1_2_lut_0 [0:127];
    reg [2:0] m15_theta_ring1_2_lut_1 [0:127];
    reg [2:0] m15_theta_ring1_2_lut_2 [0:127];
    reg [2:0] m15_theta_else_lut_0 [0:127];
    reg [2:0] m15_theta_else_lut_1 [0:127];
    reg [2:0] m15_theta_else_lut_2 [0:127];

    reg [3:0] mode_to_gmt_qlt [63:0];
    
    initial
    begin
  
        // fill phi compression LUTs
        // files received from Andrew 2017-05-01
        $readmemh("dPhiBinNLB_4bit_256Max.mem", phi_4b_0);
        $readmemh("dPhiBinNLB_4bit_256Max.mem", phi_4b_1);
        $readmemh("dPhiBinNLB_4bit_256Max.mem", phi_4b_2);
        $readmemh("dPhiBinNLB_5bit_256Max.mem", phi_5b_0);
        $readmemh("dPhiBinNLB_5bit_256Max.mem", phi_5b_1);
        $readmemh("dPhiBinNLB_5bit_256Max.mem", phi_5b_2);
        $readmemh("dPhiBinNLB_7bit_512Max.mem", phi_7b_0);
        $readmemh("dPhiBinNLB_7bit_512Max.mem", phi_7b_1);
        $readmemh("dPhiBinNLB_7bit_512Max.mem", phi_7b_2);
        
        // theta conversion LUTs according to EMTF PT LUT address doc, draft 2 from Andrew, 2017-04-19
        // LUTs regenerated according to document version 2017-06-05
        // source in pt_addr_rework_luts.xlsx
        $readmemh("m15_theta_ring1_2.mem", m15_theta_ring1_2_lut_0);
        $readmemh("m15_theta_ring1_2.mem", m15_theta_ring1_2_lut_1);
        $readmemh("m15_theta_ring1_2.mem", m15_theta_ring1_2_lut_2);
        $readmemh("m15_theta_else.mem"   , m15_theta_else_lut_0);
        $readmemh("m15_theta_else.mem"   , m15_theta_else_lut_1);
        $readmemh("m15_theta_else.mem"   , m15_theta_else_lut_2);

        // mode to gmt quality conversion according to Andrew's message 2018-4-30
        // address: {th>88, mode}
        $readmemh("mode_to_gmt_qlt.mem"  , mode_to_gmt_qlt);

    end
    
    // front-rear LUTs
    // [sector[0]][station 0-4][chamber id]
    reg [12:0] fr [1:0][4:0];
    // fr contents comes from FRLUT.cc generated by M. Carver on 2015-10-15
    // reversed bit order, added neighbor sector stations
    // chamber numbers start from 1, so add an extra low bit for invalid chamber = 0 
    assign fr [0][0] = 13'b011000010010_0;
    assign fr [0][1] = 13'b000000101101_0;
    assign fr [0][2] = 13'b010101010101_0;
    assign fr [0][3] = 13'b001010101010_0;
    assign fr [0][4] = 13'b001010101010_0;
    
    assign fr [1][0] = 13'b011000010010_0;
    assign fr [1][1] = 13'b000000101101_0;
    assign fr [1][2] = 13'b011101010010_0;
    assign fr [1][3] = 13'b000010101101_0;
    assign fr [1][4] = 13'b000010101101_0;
    
    reg [3:0] mode [2:0];
    reg [6:0] dphiA [2:0];
    reg [4:0] dphiB [2:0];
    reg [3:0] dphiC [2:0];
    reg [3:0] chA, chB;
    
    reg [bw_fph+13-1:0] gmt_phi_mult [2:0]; // phi 13 bits, factor 13 bits
    
    // mode2 LUT, according to EMTF PT LUT address doc, draft 2 from Andrew, 2017-04-19
    reg [2:0] mode2_lut [15:0];
    assign mode2_lut[0]  = 3'd0;
    assign mode2_lut[1]  = 3'd0;
    assign mode2_lut[2]  = 3'd0;
    assign mode2_lut[3]  = 3'd2;
    assign mode2_lut[4]  = 3'd0;
    assign mode2_lut[5]  = 3'd3;
    assign mode2_lut[6]  = 3'd4;
    assign mode2_lut[7]  = 3'd0;
    assign mode2_lut[8]  = 3'd0;
    assign mode2_lut[9]  = 3'd5;
    assign mode2_lut[10] = 3'd6;
    assign mode2_lut[11] = 3'd0;
    assign mode2_lut[12] = 3'd7;
    assign mode2_lut[13] = 3'd0;
    assign mode2_lut[14] = 3'd0;
    assign mode2_lut[15] = 3'd0;

    // mode3 LUT, according to EMTF PT LUT address doc, draft 2 from Andrew, 2017-04-19
    reg [1:0] mode3_lut [15:0];
    assign mode3_lut[0]  = 2'd0;
    assign mode3_lut[1]  = 2'd0;
    assign mode3_lut[2]  = 2'd0;
    assign mode3_lut[3]  = 2'd0;
    assign mode3_lut[4]  = 2'd0;
    assign mode3_lut[5]  = 2'd0;
    assign mode3_lut[6]  = 2'd0;
    assign mode3_lut[7]  = 2'd0;
    assign mode3_lut[8]  = 2'd0;
    assign mode3_lut[9]  = 2'd0;
    assign mode3_lut[10] = 2'd0;
    assign mode3_lut[11] = 2'd1;
    assign mode3_lut[12] = 2'd0;
    assign mode3_lut[13] = 2'd2;
    assign mode3_lut[14] = 2'd3;
    assign mode3_lut[15] = 2'd0;
    
    // CLCT compression LUTs
    reg [2:0] clct_3b_lut [1:0][15:0];
    // [0]=endcap0 sign0, endcap1 sign1   [1]=endcap0 sign1, endcap1 sign0
    assign clct_3b_lut[0][ 0] = 3'd0; assign clct_3b_lut[1][ 0] = 3'd0; 
    assign clct_3b_lut[0][ 1] = 3'd0; assign clct_3b_lut[1][ 1] = 3'd0; 
    assign clct_3b_lut[0][ 2] = 3'd7; assign clct_3b_lut[1][ 2] = 3'd1; 
    assign clct_3b_lut[0][ 3] = 3'd1; assign clct_3b_lut[1][ 3] = 3'd7; 
    assign clct_3b_lut[0][ 4] = 3'd7; assign clct_3b_lut[1][ 4] = 3'd1; 
    assign clct_3b_lut[0][ 5] = 3'd1; assign clct_3b_lut[1][ 5] = 3'd7; 
    assign clct_3b_lut[0][ 6] = 3'd6; assign clct_3b_lut[1][ 6] = 3'd2; 
    assign clct_3b_lut[0][ 7] = 3'd2; assign clct_3b_lut[1][ 7] = 3'd6; 
    assign clct_3b_lut[0][ 8] = 3'd5; assign clct_3b_lut[1][ 8] = 3'd3; 
    assign clct_3b_lut[0][ 9] = 3'd3; assign clct_3b_lut[1][ 9] = 3'd5; 
    assign clct_3b_lut[0][10] = 3'd4; assign clct_3b_lut[1][10] = 3'd4; 
    assign clct_3b_lut[0][11] = 3'd0; assign clct_3b_lut[1][11] = 3'd0; 
    assign clct_3b_lut[0][12] = 3'd0; assign clct_3b_lut[1][12] = 3'd0; 
    assign clct_3b_lut[0][13] = 3'd0; assign clct_3b_lut[1][13] = 3'd0; 
    assign clct_3b_lut[0][14] = 3'd0; assign clct_3b_lut[1][14] = 3'd0; 
    assign clct_3b_lut[0][15] = 3'd0; assign clct_3b_lut[1][15] = 3'd0; 

    reg [1:0] clct_2b_lut [1:0][15:0];
    // [0]=endcap0 sign0, endcap1 sign1   [1]=endcap0 sign1, endcap1 sign0
    assign clct_2b_lut[0][ 0] = 2'd0; assign clct_2b_lut[1][ 0] = 2'd0; 
    assign clct_2b_lut[0][ 1] = 2'd0; assign clct_2b_lut[1][ 1] = 2'd0; 
    assign clct_2b_lut[0][ 2] = 2'd3; assign clct_2b_lut[1][ 2] = 2'd0; 
    assign clct_2b_lut[0][ 3] = 2'd0; assign clct_2b_lut[1][ 3] = 2'd3; 
    assign clct_2b_lut[0][ 4] = 2'd3; assign clct_2b_lut[1][ 4] = 2'd0; 
    assign clct_2b_lut[0][ 5] = 2'd0; assign clct_2b_lut[1][ 5] = 2'd3; 
    assign clct_2b_lut[0][ 6] = 2'd3; assign clct_2b_lut[1][ 6] = 2'd0; 
    assign clct_2b_lut[0][ 7] = 2'd0; assign clct_2b_lut[1][ 7] = 2'd3; 
    assign clct_2b_lut[0][ 8] = 2'd2; assign clct_2b_lut[1][ 8] = 2'd1; 
    assign clct_2b_lut[0][ 9] = 2'd1; assign clct_2b_lut[1][ 9] = 2'd2; 
    assign clct_2b_lut[0][10] = 2'd1; assign clct_2b_lut[1][10] = 2'd1; 
    assign clct_2b_lut[0][11] = 2'd0; assign clct_2b_lut[1][11] = 2'd0; 
    assign clct_2b_lut[0][12] = 2'd0; assign clct_2b_lut[1][12] = 2'd0; 
    assign clct_2b_lut[0][13] = 2'd0; assign clct_2b_lut[1][13] = 2'd0; 
    assign clct_2b_lut[0][14] = 2'd0; assign clct_2b_lut[1][14] = 2'd0; 
    assign clct_2b_lut[0][15] = 2'd0; assign clct_2b_lut[1][15] = 2'd0; 
    
    reg [2:0] dth_3b_lut [1:0][4:0];
    reg [1:0] dth_2b_lut [1:0][4:0];
    // first index matches sth (theta sign)
    assign dth_3b_lut[0][0] = 3'd4; assign dth_3b_lut[1][0] = 3'd4; assign dth_2b_lut[0][0] = 2'd2; assign dth_2b_lut[1][0] = 2'd2; 
    assign dth_3b_lut[0][1] = 3'd3; assign dth_3b_lut[1][1] = 3'd5; assign dth_2b_lut[0][1] = 2'd2; assign dth_2b_lut[1][1] = 2'd2; 
    assign dth_3b_lut[0][2] = 3'd2; assign dth_3b_lut[1][2] = 3'd6; assign dth_2b_lut[0][2] = 2'd1; assign dth_2b_lut[1][2] = 2'd1; 
    assign dth_3b_lut[0][3] = 3'd1; assign dth_3b_lut[1][3] = 3'd7; assign dth_2b_lut[0][3] = 2'd0; assign dth_2b_lut[1][3] = 2'd3; 
    assign dth_3b_lut[0][4] = 3'd0; assign dth_3b_lut[1][4] = 3'd7; assign dth_2b_lut[0][4] = 2'd0; assign dth_2b_lut[1][4] = 2'd3; 
    
    
    reg [2:0] mode2 [2:0];
    reg [1:0] mode3 [2:0];
    reg [4:0] theta_5b [2:0];
    reg [6:0] theta_7b [2:0];
    reg [1:0] rpc_2b [2:0];
    reg [2:0] clct_3b_A [2:0];
    reg [2:0] clct_3b_B [2:0];
    reg [1:0] clct_2b_A [2:0];
    reg [2:0] dth_3b [2:0];
    reg [1:0] dth_2b [2:0];
    reg [2:0] dth_red [2:0];
    reg [2:0] sphBC, sphCD;
    reg [2:0] m15_theta [2:0];
    reg [4:0] m15_r2_rpc [2:0];
    reg [3:0] clct_is_0 [2:0];
    reg [2:0] n_rpc [2:0];
    reg [4:0] m15_r2_rpc_clct1 [2:0];
    reg [3:0] m15_r1_rpc_clct1 [2:0];
    reg [1:0] m15_r1_rpc [2:0];
    reg [2:0] ring1_2;
    reg [1:0] m15_theta_rem3 [2:0];
    reg [7:0] th_8b [2:0];
    reg [4:0] gmt_lut_addr [2:0];


// macro for detecting same bank address
// bank and chip must match, and valid flags must be set
// a and b are indexes 0,1,2    
`define sb(a,b) (ptlut_addr[a][29:26] == ptlut_addr[b][29:26] && ptlut_addr[a][5:2] == ptlut_addr[b][5:2] && ptlut_addr_val[a] && ptlut_addr_val[b])    

    // replace last bt rank with single hit trigger if it's not occupied
    assign bt_rank_o[0] = bt_rank_i[0];
    assign bt_rank_o[1] = bt_rank_i[1];
    assign bt_rank_o[2] = (bt_rank_i[2] == 0 && vl_single == 1'b1) ? 1 : bt_rank_i[2];


    always @(posedge clk)
    begin

        for (i = 0; i < 3; i = i+1) // best track loop
        begin
            bt_rank[i]  = bt_rank_i[i];
            bt_phi[i]   = bt_phi_i[i];
            bt_theta[i] = bt_theta_i[i];
        end    

        // insert single if available
        if (bt_rank[2] == 0 && vl_single == 1'b1)
        begin
            bt_theta[2] = th_single;
            bt_phi[2] = ph_single;
            bt_rank[2] = 1;
        end

    
        // apply theta to eta conversion
        gmt_eta[0] = th_eta0[bt_theta[0]];
        gmt_eta[1] = th_eta1[bt_theta[1]];
        gmt_eta[2] = th_eta2[bt_theta[2]];
        


        for (i = 0; i < 3; i = i+1) // best track loop
        begin
        
            // convert phi into gmt scale according to DN15-017
            // full scale is -16 to 100, or 116 values, covers range -10 to 62.5 deg
            // my internal ph scale is 0..5000, covers from -22 to 63.333 deg
            // converted to GMT scale it is from -35 to 95
            // bt_phi * 107.01/4096, equivalent to bt_phi * 6849/0x40000
            gmt_phi_mult[i] = bt_phi[i] * 13'd6991; // constant changed on Jia Fu request, 2017-03-17
            gmt_phi[i] = gmt_phi_mult[i][25:18]; // divide by 0x40000
            gmt_phi[i] = gmt_phi[i] - 8'd35; // offset of -22 deg 
            
            if (endcap == 1'b1) gmt_eta[i] = ~gmt_eta[i]; // if negative endcap invert eta
        
            mode[i] = {bt_rank[i][5], bt_rank[i][3], bt_rank[i][1], bt_rank[i][0]};
            
            
            ptlut_addr_val[i] = bt_rank[i] != 0; // address valid if rank is non-zero
            
            ptlut_addr[i] = 30'h0;
            ptlut_cs[i] = 32'hffffffff;
            
            if (ptlut_addr_val[i])
            begin
                // depending on mode, decide which stations and differences to use in PT LUT address
                case (mode[i])
                    4'd1:  begin stA = 3'h0; stB = 3'h0; dA = 3'h0; dB = 3'h0; dT = 3'h0; end // single hit trigger 
                    4'd12: begin stA = 3'h0; stB = 3'h1; dA = 3'h0; dB = 3'h0; dT = 3'h0; end // 1-2
                    4'd10: begin stA = 3'h0; stB = 3'h2; dA = 3'h1; dB = 3'h1; dT = 3'h1; end // 1-3
                    4'd9:  begin stA = 3'h0; stB = 3'h3; dA = 3'h2; dB = 3'h2; dT = 3'h2; end // 1-4
                    4'd6:  begin stA = 3'h1; stB = 3'h2; dA = 3'h3; dB = 3'h3; dT = 3'h3; end // 2-3
                    4'd5:  begin stA = 3'h1; stB = 3'h3; dA = 3'h4; dB = 3'h4; dT = 3'h4; end // 2-4
                    4'd3:  begin stA = 3'h2; stB = 3'h3; dA = 3'h5; dB = 3'h5; dT = 3'h5; end // 3-4
                    4'd14: begin stA = 3'h0; stB = 3'h1; stC = 3'h2; dA = 3'h0; dB = 3'h3; dT = 3'h1; end // 1-2-3
                    4'd13: begin stA = 3'h0; stB = 3'h1; stC = 3'h3; dA = 3'h0; dB = 3'h4; dT = 3'h2; end // 1-2-4
                    4'd11: begin stA = 3'h0; stB = 3'h2; stC = 3'h3; dA = 3'h1; dB = 3'h5; dT = 3'h2; end // 1-3-4
                    4'd7:  begin stA = 3'h1; stB = 3'h2; stC = 3'h3; dA = 3'h3; dB = 3'h5; dT = 3'h4; end // 2-3-4
                    4'd15: begin stA = 3'h0; stB = 3'h1; stC = 3'h2; dA = 3'h0; dB = 3'h3; dC = 3'd5; dT = 3'h2; end // 1-2-3-4
                endcase            

                // fill new parameters according to EMTF PT LUT address doc, draft 2 from Andrew, 2017-04-19
                mode2[i] = mode2_lut[mode[i]];
                mode3[i] = mode3_lut[mode[i]];
                // check if ME1 ring 2 stubs are present
                if (// station 0 valid and CSCID between 4 and 9 or 11 and 12 (for neighbor sector)
                    (bt_vi[i][0][0] == 1'b1 && ((bt_ci[i][0] >= 4'd4 && bt_ci[i][0] <= 4'd9) || (bt_ci[i][0] >= 4'd11 && bt_ci[i][0] <= 4'd12))) ||
                    (bt_vi[i][1][0] == 1'b1 && bt_ci[i][1] >= 4'd4 && bt_ci[i][1] <= 4'd9)    // station 1 valid and CSCID between 4 and 9
                ) 
                begin
                    theta_7b[i] = (bt_theta[i] < 7'd104 ? bt_theta[i] : 7'd104) - 7'd1;
                    theta_5b[i] = theta_7b[i][6:2];
                    theta_5b[i] = theta_5b[i] + 5'd6;
                    case (i)
                        0: m15_theta[i] = m15_theta_ring1_2_lut_0[bt_theta[i]];
                        1: m15_theta[i] = m15_theta_ring1_2_lut_1[bt_theta[i]];
                        2: m15_theta[i] = m15_theta_ring1_2_lut_2[bt_theta[i]];
                    endcase
                    ring1_2[i] = 1'b1;
                end        
                else
                begin
                    theta_7b[i] = (bt_theta[i] > 7'd1 ? bt_theta[i] : 7'd1) - 7'd1;
                    theta_5b[i] = theta_7b[i][6:2];
                    case (i)
                        0: m15_theta[i] = m15_theta_else_lut_0[bt_theta[i]];
                        1: m15_theta[i] = m15_theta_else_lut_1[bt_theta[i]];
                        2: m15_theta[i] = m15_theta_else_lut_2[bt_theta[i]];
                    endcase
                    ring1_2[i] = 1'b0;
                end

                if      (bt_cpattern[i][stA] == 0) rpc_2b[i] = 2'd0;
                else if (bt_cpattern[i][stC] == 0) rpc_2b[i] = 2'd1;
                else if (bt_cpattern[i][stB] == 0) rpc_2b[i] = 2'd2;
                else                               rpc_2b[i] = 2'd3;
                
                clct_3b_A[i] = (endcap == bt_sign_ph[i][dA]) ? clct_3b_lut[0][bt_cpattern[i][stA]] : clct_3b_lut[1][bt_cpattern[i][stA]];
                clct_3b_B[i] = (endcap == bt_sign_ph[i][dB]) ? clct_3b_lut[0][bt_cpattern[i][stB]] : clct_3b_lut[1][bt_cpattern[i][stB]];
                clct_2b_A[i] = (endcap == bt_sign_ph[i][dA]) ? clct_2b_lut[0][bt_cpattern[i][stA]] : clct_2b_lut[1][bt_cpattern[i][stA]];
                
                dth_red[i] = bt_delta_th[i][dT] >= 7'd4 ? 3'd4 : bt_delta_th[i][dT]; // limit dth by 4
                dth_3b[i] = dth_3b_lut[bt_sign_th[i][dT]][dth_red[i]];
                dth_2b[i] = dth_2b_lut[bt_sign_th[i][dT]][dth_red[i]];

                // limit the maximum LUT indexes
                dphi_4bits[i] = bt_delta_ph[i][dC] > 13'd511 ? 9'd511 : bt_delta_ph[i][dC];
                dphi_5bits[i] = bt_delta_ph[i][dB] > 13'd511 ? 9'd511 : bt_delta_ph[i][dB];
                dphi_7bits[i] = bt_delta_ph[i][dA] > 13'd511 ? 9'd511 : bt_delta_ph[i][dA];
                // compress delta phi
                case (i)
                    0: begin dphiA[i] = phi_7b_0[dphi_7bits[i]]; dphiB[i] = phi_5b_0[dphi_5bits[i]]; dphiC[i] = phi_4b_0[dphi_4bits[i]]; end
                    1: begin dphiA[i] = phi_7b_1[dphi_7bits[i]]; dphiB[i] = phi_5b_1[dphi_5bits[i]]; dphiC[i] = phi_4b_1[dphi_4bits[i]]; end
                    2: begin dphiA[i] = phi_7b_2[dphi_7bits[i]]; dphiB[i] = phi_5b_2[dphi_5bits[i]]; dphiC[i] = phi_4b_2[dphi_4bits[i]]; end
                endcase

                // relative signs
                sphBC[i] = (bt_sign_ph[i][dB] == bt_sign_ph[i][dA]) ? 1'b1 : 1'b0; 
                sphCD[i] = (bt_sign_ph[i][dC] == bt_sign_ph[i][dA]) ? 1'b1 : 1'b0;
                
                // calculating insane 8b_theta_rpc_clct1 combined parameter according to EMTF PT LUT address doc, draft 2 from Andrew, 2017-04-19 
                n_rpc[i] = 3'd0;
                clct_is_0[i] = 4'd0;
                for (j = 0; j < 4; j = j+1) // station loop
                begin
                    if (bt_cpattern[i][j] == 4'd0 && mode[i][3-j] == 1'b1) // pattern  = 0 and hit from that station present
                    begin
                        clct_is_0[i][j] = 1'b1;
                        n_rpc[i] = n_rpc[i] + 3'b1;
                    end
                end

                if      (n_rpc[i] >= 3'd2 && clct_is_0[i][0] && clct_is_0[i][1]) m15_r2_rpc[i] =  5'd0; 
                else if (n_rpc[i] >= 3'd2 && clct_is_0[i][0] && clct_is_0[i][2]) m15_r2_rpc[i] =  5'd1; 
                else if (n_rpc[i] >= 3'd2 && clct_is_0[i][0] && clct_is_0[i][3]) m15_r2_rpc[i] =  5'd2; 
                else if (n_rpc[i] == 3'd1 && clct_is_0[i][0]                   ) m15_r2_rpc[i] =  5'd3; 
                else if (n_rpc[i] >= 3'd2 && clct_is_0[i][3] && clct_is_0[i][1]) m15_r2_rpc[i] =  5'd4; 
                else if (n_rpc[i] >= 3'd2 && clct_is_0[i][3] && clct_is_0[i][2]) m15_r2_rpc[i] =  5'd8; 
                else if (n_rpc[i] >= 3'd2 && clct_is_0[i][1] && clct_is_0[i][2]) m15_r2_rpc[i] = 5'd12; 
                else if (n_rpc[i] == 3'd1 && clct_is_0[i][3]                   ) m15_r2_rpc[i] = 5'd16; 
                else if (n_rpc[i] == 3'd1 && clct_is_0[i][1]                   ) m15_r2_rpc[i] = 5'd20; 
                else if (n_rpc[i] == 3'd1 && clct_is_0[i][2]                   ) m15_r2_rpc[i] = 5'd24; 
                else                                                             m15_r2_rpc[i] = 5'd28;
                
                m15_r2_rpc_clct1[i] = m15_r2_rpc[i] + {3'b0, clct_2b_A[i]};

                if      (m15_theta[i] >= 3'd4 && clct_is_0[i][3]) m15_r1_rpc[i] = 2'd0; 
                else if (m15_theta[i] >= 3'd4 && clct_is_0[i][2]) m15_r1_rpc[i] = 2'd1;             
                else if (m15_theta[i] >= 3'd4                   ) m15_r1_rpc[i] = 2'd2;             
                else                                              m15_r1_rpc[i] = 2'd3;                

                m15_r1_rpc_clct1[i] = {m15_r1_rpc[i], clct_2b_A[i]};
                
                m15_theta_rem3[i] = m15_theta[i] & 3'h3; // %4, changed according to document 2017-06-05
                if   (ring1_2[i] == 1'b1) th_8b[i] = {m15_theta[i], m15_r2_rpc_clct1[i]} + 8'd64; 
                else                      th_8b[i] = {m15_theta_rem3[i], m15_r1_rpc_clct1[i]};
                
                case (mode[i])
				    4'd12, 4'd10, 4'd9, 4'd6, 4'd5, 4'd3:// two-stub tracks                    
                    begin
                        // find valid chamber ID from station 1
                        if (stA == 3'h0 && bt_vi[i][0] != 2'b0)
                        begin
                            bt_stA = stA;
                            chA = bt_ci[i][0];
                        end
                        else
                        begin
                            bt_stA = stA + 3'h1;
                            chA = bt_ci[i][bt_stA];
                        end
                        // station B    
                        bt_stB = stB + 3'h1;
                        chB = bt_ci[i][bt_stB];
                        
                        ptlut_addr[i] = 
                        {
                            4'b0000,
                            mode2[i],
                            theta_5b[i],
                            clct_3b_B[i],
                            clct_3b_A[i],
                            fr [sector[0]][bt_stB][chB],
                            fr [sector[0]][bt_stA][chA],
                            dth_3b[i],
                            dphiA[i]
                        };        
                    end
                        
                    4'd14, 4'd11, 4'd13: // three-stub tracks
                    begin
                        // find valid chamber ID from station 1
                        stA = 3'h0;
                        if (bt_vi[i][0] != 2'b0)
                        begin
                            bt_stA = 3'h0; 
                            chA = bt_ci[i][0];
                        end
                        else
                        begin 
                            bt_stA = 3'h1; 
                            chA = bt_ci[i][1];
                        end
                        // station B
                        bt_stB = stB + 3'h1;
                        chB = bt_ci[i][bt_stB];

                        ptlut_addr[i] = 
                        {
                            1'b0,
                            mode3[i],
                            theta_5b[i],
                            rpc_2b[i],
                            clct_2b_A[i],
                            fr [sector[0]][bt_stB][chB],
                            fr [sector[0]][bt_stA][chA],
                            dth_3b[i],
                            sphBC[i],
                            dphiB[i],
                            dphiA[i]
                        };        
                    end
    
                    4'd7: // 2-3-4 special case
                    begin
                        bt_stA = stA + 3'h1;
                        chA = bt_ci[i][bt_stA];
                          
                        ptlut_addr[i] = 
                        {
                            1'b0001,
                            theta_5b[i],
                            rpc_2b[i],
                            clct_2b_A[i],
                            fr [sector[0]][bt_stA][chA],
                            dth_3b[i],
                            sphBC[i],
                            dphiB[i],
                            dphiA[i]
                        };        
                    end
    
                    4'd15: // 1-2-3-4 special case
                    begin
                        // find valid chamber ID from station 1
                        if (bt_vi[i][0] != 2'b0)
                        begin
                            bt_stA = 3'h0; 
                            chA = bt_ci[i][0];
                        end
                        else
                        begin 
                            bt_stA = 3'h1; 
                            chA = bt_ci[i][1];
                        end
                        
                        
                        ptlut_addr[i] = 
                        {
                            1'b1,
                            th_8b[i],
                            fr [sector[0]][bt_stA][chA],
                            dth_2b[i],
                            sphCD[i],
                            sphBC[i],
                            dphiC[i],
                            dphiB[i],
                            dphiA[i]
                        };        
                    end
                    
                    4'd8: // single hit trigger
                    begin
                        ptlut_addr[i] = 0;
                    end
                endcase
                
                // pre-decode chip selects
                ptlut_cs[i][{ptlut_addr[i][29:26], 1'b0}] = 1'b0; // one chip, in the lower 1GB only 
            end
            else
            begin
                ptlut_addr[i] = 30'h0;
                ptlut_cs[i] = 32'hffffffff;
            end

            // convert mode to quality using LUT (Andrew 2018-4-30)
            gmt_lut_addr[i][4] = bt_theta[i] > 7'd88 ? 1'b1 : 1'b0;
            gmt_lut_addr[i][3:0] = mode[i];
            gmt_qlt[i] = mode_to_gmt_qlt[gmt_lut_addr[i]]; 

            // Matt's code for GMT charge assignment, message from 2016-04-21
            
            case (mode[i])
                4'd15: begin if ((bt_sign_ph[i][0] == 1'b1) || (bt_delta_ph[i][0] == 13'd0 && bt_sign_ph[i][1] == 1'b0) || (bt_delta_ph[i][1] == 13'd0 && bt_sign_ph[i][2] == 1'b0)) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd14: begin if ((bt_sign_ph[i][0] == 1'b0) || (bt_delta_ph[i][0] == 13'd0 && bt_sign_ph[i][1] == 1'b0)) gmt_crg[i] = 1'b0; else gmt_crg[i] = 1'b1; end
                4'd13: begin if ((bt_sign_ph[i][0] == 1'b1) || (bt_delta_ph[i][0] == 13'd0 && bt_sign_ph[i][2] == 1'b0)) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd12: begin if  (bt_sign_ph[i][0] == 1'b1) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd11: begin if ((bt_sign_ph[i][1] == 1'b1) || (bt_delta_ph[i][1] == 13'd0 && bt_sign_ph[i][2] == 1'b0)) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd10: begin if  (bt_sign_ph[i][1] == 1'b1) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd9:  begin if  (bt_sign_ph[i][2] == 1'b1) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd7:  begin if ((bt_sign_ph[i][3] == 1'b1) || (bt_delta_ph[i][3] == 13'd0 && bt_sign_ph[i][4] == 1'b0)) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd6:  begin if  (bt_sign_ph[i][3] == 1'b1) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd5:  begin if  (bt_sign_ph[i][4] == 1'b1) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                4'd3:  begin if  (bt_sign_ph[i][5] == 1'b1) gmt_crg[i] = 1'b1; else gmt_crg[i] = 1'b0; end
                default: begin gmt_crg[i] = 1'b0; end
            endcase
            
            // end Matt's code

            if (i == 2 && vl_single) gmt_qlt[i] = cpat_single; // for single LCT, quality == CLCT pattern

        end
            
        // remove worst track if it addresses the same bank as one of two best tracks
        if (`sb(0,2) || `sb(1,2)) ptlut_addr_val[2] = 1'b0;       
                
    end

endmodule