// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Fri Apr 10 16:37:58 2020
// Host        : endcap-tf1.phys.ufl.edu running 64-bit CentOS Linux release 7.7.1908 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/madorsky/cernbox/projects/vivado/emtf_v7/core/emtf_core_mgtb/emtf_core.srcs/ptlut_data_mem/ip/ptlut_data_mem/ptlut_data_mem_stub.v
// Design      : ptlut_data_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2.1" *)
module ptlut_data_mem(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[9:0],dina[35:0],douta[35:0],clkb,web[0:0],addrb[9:0],dinb[35:0],doutb[35:0]" */;
  input clka;
  input [0:0]wea;
  input [9:0]addra;
  input [35:0]dina;
  output [35:0]douta;
  input clkb;
  input [0:0]web;
  input [9:0]addrb;
  input [35:0]dinb;
  output [35:0]doutb;
endmodule