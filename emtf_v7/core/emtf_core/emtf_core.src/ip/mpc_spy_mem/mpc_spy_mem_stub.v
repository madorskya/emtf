// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
// Date        : Thu Jun 11 04:42:39 2020
// Host        : uftrig01.dyndns.cern.ch running 64-bit Scientific Linux CERN SLC release 6.10 (Carbon)
// Command     : write_verilog -force -mode synth_stub
//               /home/madorsky/cernbox/projects/vivado/emtf_v7/core/emtf_core/emtf_core.src/ip/mpc_spy_mem/mpc_spy_mem_stub.v
// Design      : mpc_spy_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_6,Vivado 2017.2" *)
module mpc_spy_mem(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[12:0],dina[63:0],douta[63:0],clkb,web[0:0],addrb[8:0],dinb[1023:0],doutb[1023:0]" */;
  input clka;
  input [0:0]wea;
  input [12:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb;
  input [0:0]web;
  input [8:0]addrb;
  input [1023:0]dinb;
  output [1023:0]doutb;
endmodule