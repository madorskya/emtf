`timescale 1ns / 1ps

`include "vppc_macros.sv"
`ifdef SIMULATION_DAQ
    `include "spbits.sv"
`endif
// neural net tux, IOs are matching SP core
module nn_tux
(
    // precise phi and theta of best tracks
    // [best_track_num]
    input [bw_fph-1:0] bt_phi [2:0],
    input [bw_th-1:0]  bt_theta [2:0],
    // [best_track_num][station]
    input [3:0]        bt_cpattern [2:0][3:0],
    // ph and th deltas from best stations
    // [best_track_num], last index: 0=12, 1=13, 2=14, 3=23, 4=24, 5=34
    input [bw_fph-1:0] bt_delta_ph [2:0][5:0],
    input [bw_th-1:0]  bt_delta_th [2:0][5:0], 
    input [5:0]        bt_sign_ph[2:0],
    input [5:0]        bt_sign_th[2:0],
    // ranks [best_track_num]
    input [bwr:0]      bt_rank [2:0],
    // segment IDs
    // [best_track_num][station 0-3]
    input [seg_ch-1:0] bt_vi [2:0][4:0], // valid
    input [1:0]        bt_hi [2:0][4:0], // bx index
    input [3:0]        bt_ci [2:0][4:0], // chamber
    input [4:0]        bt_si [2:0], // segment
    
    output reg [7:0] pt_out [2:0],
    output reg [2:0] pt_valid,
    output reg [2:0] d0_out [2:0],
    output reg [2:0] d0_valid,
    // clock
    input                 clk,
    
    input endcap,
    input [2:0] sector

);
`include "spbits.sv"

    // convert patterns into bend angles
    // message from Sergo 2022-01-20
    // note that the output bend angle is not the same as bend angle reported by new TMB firmware
    wire [17:0] bt_bend [2:0][3:0];
    genvar gi, gj;
    generate
        for (gi = 0; gi < 3; gi++) // best track loop
        begin
            for (gj = 0; gj < 4; gj++) // station loop
            begin
                pat_2_bend p2b 
                (
                    .endcap  (endcap), 
                    .pattern (bt_cpattern [gi][gj]),
                    .bend    (bt_bend     [gi][gj])
                );                
            end
        end
    endgenerate

    integer i, j;
    

    logic vb_re1, vb_re2, vb_re3, vb_re4;
    
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
    
    logic [3:0] mode [2:0];
    logic [2:0] stA [2:0];
    logic [2:0] bt_stA [2:0];
    logic [3:0] chA [2:0];
    logic [2:0] ring1_0;
    logic [5:0] delta_valid [2:0];
    
    reg signed [17:0]  bt_delta_ph_r [2:0][5:0]; // these are signed 2's complements converted from regular deltas
    reg signed [17:0]  bt_delta_th_r [2:0][5:0]; // these are signed 2's complements converted from regular deltas
    reg signed [17:0]  bt_delta_ph_s [2:0][5:0]; // these are signed 2's complements converted from regular deltas
    reg signed [17:0]  bt_delta_th_s [2:0][5:0]; // these are signed 2's complements converted from regular deltas
    reg        [17:0]  bt_bend_r [2:0][3:0];
    reg [bw_th-1:0] bt_theta_r [2:0];

    
/*
data_0_V => deltaPhi1,     deltaPhi 1-2
data_1_V => deltaPhi2,     deltaPhi 1-3
data_2_V => deltaPhi3,     deltaPhi 1-4
data_3_V => deltaPhi4,    deltaPhi 2-3
data_4_V => deltaPhi5,    deltaPhi 2-4
data_5_V => deltaPhi6,    deltaPhi 3-4
data_6_V => deltaTheta1,  same as Phi
data_7_V => deltaTheta2,
data_8_V => deltaTheta3,
data_9_V => deltaTheta4,
data_10_V => deltaTheta5,
data_11_V => deltaTheta6,
data_12_V => bend1,   -- CLCT1 
data_13_V => bend2,  -- CLCT2
data_14_V => bend3,   -- CLCT3
data_15_V => bend4,  -- CLCT4 
data_16_V => ME1_fr,  - FR bit for ME1
data_17_V => theta,   Theta as defined in EMTF logic 
data_18_V => ME1_ring, -- 0 for ME11 , 1 for ME12
data_19_V => RPCbit1,   0 if CSC hit was used in station 1 , 1 if RPC 
data_20_V => RPCbit2, 0 if CSC hit was used in station 2 , 1 if RPC 
data_21_V => RPCbit3, 0 if CSC hit was used in station 3 , 1 if RPC 
data_22_V => RPCbit4 0 if CSC hit was used in station 4 , 1 if RPC 
*/

    
    logic [17:0] input1_V [22:0];

    logic [11:0] layer11_out_0_V;
    logic layer11_out_0_V_ap_vld;
    logic [11:0] layer11_out_1_V;
    logic layer11_out_1_V_ap_vld;


    logic [1:0] mux_phase = 2'h0;
    logic [1:0] mux_phase_out [2:0] = '{2'd0, 2'd1, 2'd2}; // output multiplexor depends on exact NN latency, needs rework if latency changes 
    logic [1:0] clk_hist;
    logic clk_120;
    
    // conversion LUTs according to Sergo's message from 2021-09-22
    // separate LUT for each best track
    // [best_track_num][location]
    reg [7:0] pt_lut_0[2047:0];
    reg [2:0] d0_lut_0[2047:0];
    reg [7:0] pt_lut_1[2047:0];
    reg [2:0] d0_lut_1[2047:0];
    reg [7:0] pt_lut_2[2047:0];
    reg [2:0] d0_lut_2[2047:0];
    reg [11:0] pt_unconv [2:0];
    reg [11:0] d0_unconv [2:0];
    reg [2:0] pt_unconv_valid;
    
    localparam NN_LATENCY = 7;
    reg [2:0] valid_in [NN_LATENCY-1:0];
    
    initial
    begin
        $readmemb("conv11to8.mem", pt_lut_0);
        $readmemb("conv11to2.mem", d0_lut_0);
        $readmemb("conv11to8.mem", pt_lut_1);
        $readmemb("conv11to2.mem", d0_lut_1);
        $readmemb("conv11to8.mem", pt_lut_2);
        $readmemb("conv11to2.mem", d0_lut_2);
    end
    
    reg clk40_ff = 1'b0;
    always @(posedge clk)
    begin 
        clk40_ff = ~clk40_ff;

        // output LUTs for NN, have to be in separate 40M clock for timing
        pt_out[0] = pt_lut_0 [pt_unconv[0][10:0]];
        d0_out[0] = d0_lut_0 [d0_unconv[0][11:1]];
        pt_out[1] = pt_lut_1 [pt_unconv[1][10:0]];
        d0_out[1] = d0_lut_1 [d0_unconv[1][11:1]];
        pt_out[2] = pt_lut_2 [pt_unconv[2][10:0]];
        d0_out[2] = d0_lut_2 [d0_unconv[2][11:1]];

        pt_valid = valid_in[NN_LATENCY-1]; // converted value valid
        d0_valid = valid_in[NN_LATENCY-1];
        
        pt_unconv_valid = valid_in[NN_LATENCY-2]; // unconverted value valid one BX before converted (for simulation only)
        
        // delay line for valid input signal matching NN latency
        // output is used as valid output flags, since NN does not provide any "valid" output flag
        for (i = NN_LATENCY-2; i >= 0; i--)
        begin
            valid_in[i+1] = valid_in[i];
        end

        valid_in[0] = 3'b0;
        for (i = 0; i < 3; i++)
        begin
            if 
            (
                mode[i] != 4'b0000  && 
                mode[i] != 4'b0001  && 
                mode[i] != 4'b0010  && 
                mode[i] != 4'b0100  && 
                mode[i] != 4'b1000 
            )
                valid_in[0][i] = 1'b1; // if more than one station detected, inputs valid
        end

    end
    
    always @(posedge clk_120)
    begin
    
        for (i = 0; i <= 5; i++)
        begin
            if (delta_valid[mux_phase][i] == 1'b1)
            begin        
                input1_V[i]   = bt_delta_ph_r[mux_phase][i];
                input1_V[i+6] = bt_delta_th_r[mux_phase][i];
            end
            else
            begin  
                input1_V[i]   = 18'b0;
                input1_V[i+6] = 18'b0;
            end     
            
        end

        if (mode[mux_phase][3] == 1)  // mode bit 3 is station 1
        begin
            input1_V[12] = bt_bend_r[mux_phase][0];
            input1_V[16] = fr [sector[0]][bt_stA[mux_phase]][chA[mux_phase]];  // fr bit valid only if ME1 is present    
            input1_V[18] = ring1_0[mux_phase];  // ring valid only if ME1 is present      
            input1_V[19] = bt_bend_r[mux_phase][0] == 18'b0; 
        end  
        else
        begin
            input1_V[12] = 18'b0;
            input1_V[16] = 18'b0;
            input1_V[18] = 18'b0;
            input1_V[19] = 18'b0;
        end  
        
        if (mode[mux_phase][2] == 1)
        begin
            input1_V[13] = bt_bend_r[mux_phase][1];
            input1_V[20] = bt_bend_r[mux_phase][1] == 18'b0;
        end  
        else
        begin
            input1_V[13] = 18'b0;
            input1_V[20] = bt_bend_r[mux_phase][1] == 18'b0;
        end  
        
        if (mode[mux_phase][1] == 1)
        begin
            input1_V[14] = bt_bend_r[mux_phase][2];
            input1_V[21] = bt_bend_r[mux_phase][2] == 18'b0;
        end  
        else
        begin
            input1_V[14] = 18'b0;
            input1_V[21] = 18'b0;
        end  
        
        if (mode[mux_phase][0] == 1)
        begin
            input1_V[15] = bt_bend_r[mux_phase][3];
            input1_V[22] = bt_bend_r[mux_phase][3] == 18'b0;
        end  
        else
        begin
            input1_V[15] = 18'b0;
            input1_V[22] = 18'b0;
        end  
        
        if (mode[mux_phase] != 4'b0)
            input1_V[17] = bt_theta[mux_phase];
        else
            input1_V[17] = 18'b0;
        
        
        pt_unconv[mux_phase_out[mux_phase]] = layer11_out_0_V[11:0];
        d0_unconv[mux_phase_out[mux_phase]] = layer11_out_1_V[11:0];

        mode[mux_phase] = {bt_rank[mux_phase][5], bt_rank[mux_phase][3], bt_rank[mux_phase][1], bt_rank[mux_phase][0]};
        // find valid chamber ID from station 1
        case (mode[mux_phase])
             4'd1:  begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b000000; end // single hit trigger 
             4'd12: begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b000001; end // 1-2
             4'd10: begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b000010; end // 1-3
             4'd9:  begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b000100; end // 1-4
             4'd6:  begin stA[mux_phase] = 3'h1; delta_valid[mux_phase] = 6'b001000; end // 2-3
             4'd5:  begin stA[mux_phase] = 3'h1; delta_valid[mux_phase] = 6'b010000; end // 2-4
             4'd3:  begin stA[mux_phase] = 3'h2; delta_valid[mux_phase] = 6'b100000; end // 3-4
             4'd14: begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b001111; end // 1-2-3
             4'd13: begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b010101; end // 1-2-4
             4'd11: begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b100110; end // 1-3-4
             4'd7:  begin stA[mux_phase] = 3'h1; delta_valid[mux_phase] = 6'b111000; end // 2-3-4
             4'd15: begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b111111; end // 1-2-3-4
             default: begin stA[mux_phase] = 3'h0; delta_valid[mux_phase] = 6'b000000; end
        endcase            

        if (stA[mux_phase] == 3'h0 && bt_vi[mux_phase][0] != 2'b0)
        begin
            bt_stA[mux_phase] = stA[mux_phase];
            chA[mux_phase] = bt_ci[mux_phase][0];
        end
        else
        begin
            bt_stA[mux_phase] = stA[mux_phase] + 3'h1;
            chA[mux_phase] = bt_ci[mux_phase][bt_stA[mux_phase]];
        end
        // check if ME1 ring 2 stubs are present
        ring1_0[mux_phase] = 1'b1;
        if (
            (bt_vi[mux_phase][0][0] == 1'b1 && bt_ci[mux_phase][0] <= 4'd2) ||
            (bt_vi[mux_phase][1][0] == 1'b1 && bt_ci[mux_phase][1] <= 4'd2)    // station 1 valid and CSCID = 1,2,3 means ME1/1
        ) 
        begin
            ring1_0[mux_phase] = 1'b0;
        end        

        // convert deltas into signed 2's complements
        // from Sergo's message 2021-05-14:
        // "All inputs are defined as ap_fixed<18,18> type.  The MSB (bit 17) has weight -2^(n-1), others 2^(n-1)."
        for (j = 0; j < 6; j++) // difference loop
        begin
            bt_delta_ph_s [mux_phase][j] = $signed({ 5'h0, bt_delta_ph[mux_phase][j]});
            bt_delta_th_s [mux_phase][j] = $signed({11'h0, bt_delta_th[mux_phase][j]});
        
            bt_delta_ph_r [mux_phase][j] = (bt_sign_ph[mux_phase][j] == 1'b0) ? bt_delta_ph_s[mux_phase][j] : -bt_delta_ph_s[mux_phase][j];
            bt_delta_th_r [mux_phase][j] = (bt_sign_th[mux_phase][j] == 1'b0) ? bt_delta_th_s[mux_phase][j] : -bt_delta_th_s[mux_phase][j];
        end
    
        bt_bend_r  = bt_bend;
        bt_theta_r = bt_theta;

        if (clk_hist[0] != clk_hist[1]) // 40 M clk just rose
            mux_phase = 2'h0; // reset multiplexor phase
        else
            mux_phase++;

        // adding delays to prevent issues in simulation
        clk_hist[1] = #1 clk_hist[0];
        clk_hist[0] = #1 clk40_ff;
    
    end

    emtfptnn pt_nn 
    (
        .ap_clk (clk_120),
        .ap_rst (1'b0),
        .ap_start (1'b1),
        .ap_done (),
        .ap_idle (),
        .ap_ready (),
        
        .input1_0_V_ap_vld  (1'b1),                                                                  
        .input1_1_V_ap_vld  (1'b1),                                                                  
        .input1_2_V_ap_vld  (1'b1),                                                                  
        .input1_3_V_ap_vld  (1'b1),                                                                  
        .input1_4_V_ap_vld  (1'b1),                                                                  
        .input1_5_V_ap_vld  (1'b1),                                                                  
          
        .input1_6_V_ap_vld  (1'b1),                                                                  
        .input1_7_V_ap_vld  (1'b1),                                                                  
        .input1_8_V_ap_vld  (1'b1),                                                                  
        .input1_9_V_ap_vld  (1'b1),                                                                  
        .input1_10_V_ap_vld (1'b1),                                                                  
        .input1_11_V_ap_vld (1'b1),                                                                  
         
        .input1_12_V_ap_vld (1'b1), // mode bit 3 is station 1                                                                 
        .input1_13_V_ap_vld (1'b1),                                                                  
        .input1_14_V_ap_vld (1'b1),                                                                  
        .input1_15_V_ap_vld (1'b1),                                                                  
         
        .input1_16_V_ap_vld (1'b1), // fr bit valid only if ME1 is present                                                
        .input1_17_V_ap_vld (1'b1),  
        .input1_18_V_ap_vld (1'b1), // ring valid only if ME1 is present                                                                    
        .input1_19_V_ap_vld (1'b1), // CLCT patterns valid only if corresponding station is present                                                         
        .input1_20_V_ap_vld (1'b1),                                                          
        .input1_21_V_ap_vld (1'b1),                                                          
        .input1_22_V_ap_vld (1'b1),                                                          
        
        .input1_0_V  (input1_V[ 0]),
        .input1_1_V  (input1_V[ 1]),
        .input1_2_V  (input1_V[ 2]),
        .input1_3_V  (input1_V[ 3]),
        .input1_4_V  (input1_V[ 4]),
        .input1_5_V  (input1_V[ 5]), 
        
        .input1_6_V  (input1_V[ 6]),
        .input1_7_V  (input1_V[ 7]),
        .input1_8_V  (input1_V[ 8]),
        .input1_9_V  (input1_V[ 9]),
        .input1_10_V (input1_V[10]),
        .input1_11_V (input1_V[11]),
        
        .input1_12_V (input1_V[12]),
        .input1_13_V (input1_V[13]),
        .input1_14_V (input1_V[14]),
        .input1_15_V (input1_V[15]),
        
        .input1_16_V (input1_V[16]),
        .input1_17_V (input1_V[17]),
        .input1_18_V (input1_V[18]),
        .input1_19_V (input1_V[19]),
        .input1_20_V (input1_V[20]),
        .input1_21_V (input1_V[21]),
        .input1_22_V (input1_V[22]),
        
        .layer11_out_0_V        (layer11_out_0_V[11:0]),
        .layer11_out_0_V_ap_vld (layer11_out_0_V_ap_vld),
        .layer11_out_1_V        (layer11_out_1_V[11:0]),
        .layer11_out_1_V_ap_vld (layer11_out_1_V_ap_vld)
    );

    nn_mmcm nnmcmc
    (
        .clk_out1(clk_120),
        .reset(1'b0),
        .locked(),
        .clk_in1(clk)
    );


endmodule
