-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Fri Apr 10 16:37:34 2020
-- Host        : endcap-tf1.phys.ufl.edu running 64-bit CentOS Linux release 7.7.1908 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/madorsky/cernbox/projects/vivado/emtf_v7/core/emtf_core_mgtb/emtf_core.srcs/rldram_in_fifo/ip/rldram_in_fifo/rldram_in_fifo_stub.vhdl
-- Design      : rldram_in_fifo
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rldram_in_fifo is
  Port ( 
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 143 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 143 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end rldram_in_fifo;

architecture stub of rldram_in_fifo is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "rst,wr_clk,rd_clk,din[143:0],wr_en,rd_en,dout[143:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_5,Vivado 2019.2.1";
begin
end;