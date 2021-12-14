create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list usrclk_mmcm_/inst/CLK_OUT1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 76 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[8]_0[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 76 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[1]_7[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 5 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 76 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[2]_6[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 12 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 2 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 5 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 2 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 76 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[7]_1[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 76 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[5]_3[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 5 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 2 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 5 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 76 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[6]_2[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 76 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[3]_5[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 76 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[4]_4[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 5 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 2 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 2 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 5 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 76 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[11]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[12]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[13]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[14]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[15]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[16]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[17]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[18]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[19]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[20]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[21]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[22]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[23]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[24]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[25]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[26]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[27]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[28]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[29]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[30]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[31]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[32]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[33]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[34]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[35]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[36]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[37]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[38]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[39]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[40]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[41]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[42]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[43]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[44]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[45]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[46]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[47]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[48]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[49]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[50]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[51]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[52]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[53]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[54]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[55]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[56]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[57]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[58]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[59]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[60]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[61]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[62]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[63]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[64]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[65]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[66]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[67]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[68]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[69]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[70]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[71]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[72]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[73]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[74]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_data_76[0]_8[75]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 12 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 2 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 5 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 2 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 2 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 2 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 2 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 12 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 12 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 5 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 12 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 2 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 2 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 12 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 2 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 12 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 5 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/clk40_rw[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/clk40_rw[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/clk40_rw[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/clk40_rw[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/clk40_rw[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 12 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 12 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[1]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[2]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[3]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[4]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[5]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[6]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[7]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[8]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[9]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[10]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/data_delay_cnt_w[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 2 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/data_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 2 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/locked_delay_w[0]} {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/locked_delay_w[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[3].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[6].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 1 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe64]
set_property port_width 1 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[0].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe65]
set_property port_width 1 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe66]
set_property port_width 1 [get_debug_ports u_ila_0/probe66]
connect_debug_port u_ila_0/probe66 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe67]
set_property port_width 1 [get_debug_ports u_ila_0/probe67]
connect_debug_port u_ila_0/probe67 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[5].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe68]
set_property port_width 1 [get_debug_ports u_ila_0/probe68]
connect_debug_port u_ila_0/probe68 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[4].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe69]
set_property port_width 1 [get_debug_ports u_ila_0/probe69]
connect_debug_port u_ila_0/probe69 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe70]
set_property port_width 1 [get_debug_ports u_ila_0/probe70]
connect_debug_port u_ila_0/probe70 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe71]
set_property port_width 1 [get_debug_ports u_ila_0/probe71]
connect_debug_port u_ila_0/probe71 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe72]
set_property port_width 1 [get_debug_ports u_ila_0/probe72]
connect_debug_port u_ila_0/probe72 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[8].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe73]
set_property port_width 1 [get_debug_ports u_ila_0/probe73]
connect_debug_port u_ila_0/probe73 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe74]
set_property port_width 1 [get_debug_ports u_ila_0/probe74]
connect_debug_port u_ila_0/probe74 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/valid_rx}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe75]
set_property port_width 1 [get_debug_ports u_ila_0/probe75]
connect_debug_port u_ila_0/probe75 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe76]
set_property port_width 1 [get_debug_ports u_ila_0/probe76]
connect_debug_port u_ila_0/probe76 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe77]
set_property port_width 1 [get_debug_ports u_ila_0/probe77]
connect_debug_port u_ila_0/probe77 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[1].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe78]
set_property port_width 1 [get_debug_ports u_ila_0/probe78]
connect_debug_port u_ila_0/probe78 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/valid_160_d}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe79]
set_property port_width 1 [get_debug_ports u_ila_0/probe79]
connect_debug_port u_ila_0/probe79 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[7].mpcx_rx_i/rxr/err_tst_pat_160_w}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe80]
set_property port_width 1 [get_debug_ports u_ila_0/probe80]
connect_debug_port u_ila_0/probe80 [get_nets [list {mpcx_rx_i/emtf_mpcx_rx_n/rx_loop[2].mpcx_rx_i/rxr/err_tst_pat_40_w}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_i/bscan_dbghub/inst/xsdbm]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_i/bscan_dbghub/inst/xsdbm]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_i/bscan_dbghub/inst/xsdbm]
connect_debug_port dbg_i/bscan_dbghub/inst/xsdbm/clk [get_nets dbg_i/bscan_dbghub/inst/clk]
