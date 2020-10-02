create_clock -period 4.8 -name clk_del [get_ports clk_del]

set_false_path -from [get_clocks pcie_clk] -to [get_clocks clk_del]
set_false_path -from [get_clocks clk_del] -to [get_clocks pcie_clk]

set_property -dict {LOC B12} [get_ports {pt_dq[71]}]
set_property -dict {LOC C12} [get_ports {pt_dq[70]}]
set_property -dict {LOC D12} [get_ports {pt_dq[69]}]
set_property -dict {LOC E12} [get_ports {pt_dq[66]}]
set_property -dict {LOC G12} [get_ports {pt_dq[67]}]
set_property -dict {LOC H12} [get_ports {pt_dq[68]}]
set_property -dict {LOC B13} [get_ports {pt_dq[63]}]
set_property -dict {LOC C13} [get_ports {pt_dk_p_[7]}]
set_property -dict {LOC E13} [get_ports {pt_dk_n_[7]}]
set_property -dict {LOC H13} [get_ports {pt_dq[64]}]
set_property -dict {LOC K13} [get_ports {pt_dq[65]}]
set_property -dict {LOC A13} [get_ports {pt_a[12]}]
set_property -dict {LOC D14} [get_ports {pt_a[14]}]
set_property -dict {LOC E14} [get_ports {pt_ba[2]}]
set_property -dict {LOC G13} [get_ports {pt_a[19]}]
set_property -dict {LOC J14} [get_ports {pt_a[10]}]
set_property -dict {LOC K14} [get_ports {pt_a[16]}]
set_property -dict {LOC A14} [get_ports {pt_ba[3]}]
set_property -dict {LOC C14} [get_ports {pt_a[8]}]
set_property -dict {LOC E16} [get_ports {pt_ba[0]}]
set_property -dict {LOC F14} [get_ports {pt_cs[27]}]
set_property -dict {LOC H14} [get_ports {pt_a[18]}]
set_property -dict {LOC K16} [get_ports {pt_a[17]}]
set_property -dict {LOC B15} [get_ports {pt_cs[31]}]
set_property -dict {LOC D15} [get_ports {pt_ref[3]}]
set_property -dict {LOC E17} [get_ports {pt_ba[1]}]
set_property -dict {LOC F15} [get_ports {pt_a[15]}]
set_property -dict {LOC H15} [get_ports {pt_a[5]}]
set_property -dict {LOC J16} [get_ports {pt_a[6]}]
set_property -dict {LOC A15} [get_ports {pt_a[7]}]
set_property -dict {LOC C15} [get_ports {pt_a[1]}]
set_property -dict {LOC D17} [get_ports {pt_cs[26]}]
set_property -dict {LOC G15} [get_ports {pt_we[3]}]
set_property -dict {LOC J15} [get_ports {pt_a[9]}]
set_property -dict {LOC J17} [get_ports {pt_a[3]}]
set_property -dict {LOC B16} [get_ports {pt_cs[28]}]
set_property -dict {LOC D16} [get_ports {pt_dq[55]}]
set_property -dict {LOC E18} [get_ports {pt_a[0]}]
set_property -dict {LOC F16} [get_ports {pt_a[2]}]
set_property -dict {LOC G16} [get_ports {pt_a[4]}]
set_property -dict {LOC K17} [get_ports {pt_cs[25]}]
set_property -dict {LOC A16} [get_ports {pt_cs[29]}]
set_property -dict {LOC C17} [get_ports {pt_dq[54]}]
set_property -dict {LOC D19} [get_ports {pt_a[13]}]
set_property -dict {LOC G17} [get_ports {pt_a[11]}]
set_property -dict {LOC H17} [get_ports {pt_cs[24]}]
set_property -dict {LOC H18} [get_ports {pt_cs[30]}]
set_property -dict {LOC A18} [get_ports {pt_dq[60]}]
set_property -dict {LOC B17} [get_ports {pt_dk_n_[6]}]
set_property -dict {LOC E19} [get_ports {pt_dq[58]}]
set_property -dict {LOC F18} [get_ports {pt_dq[57]}]
set_property -dict {LOC G18} [get_ports {pt_dq[56]}]
set_property -dict {LOC K18} [get_ports {pt_dk_p_[6]}]
set_property -dict {LOC A19} [get_ports {pt_dq[51]}]
set_property -dict {LOC B18} [get_ports {pt_dq[52]}]
set_property -dict {LOC D20} [get_ports {pt_dq[53]}]
set_property -dict {LOC F19} [get_ports {pt_dq[61]}]
set_property -dict {LOC H19} [get_ports {pt_dq[62]}]
set_property -dict {LOC K19} [get_ports {pt_dq[59]}]
set_property -dict {LOC C18} [get_ports {pt_dq[46]}]
set_property -dict {LOC D21} [get_ports {pt_dq[47]}]
set_property -dict {LOC F20} [get_ports {pt_dq[50]}]
set_property -dict {LOC J19} [get_ports {pt_dq[49]}]
set_property -dict {LOC H20} [get_ports {pt_dq[48]}]
set_property -dict {LOC A20} [get_ports {pt_cs[23]}]
set_property -dict {LOC C19} [get_ports {pt_ref[2]}]
set_property -dict {LOC E21} [get_ports {pt_cs[19]}]
set_property -dict {LOC F21} [get_ports {pt_dq[45]}]
set_property -dict {LOC G20} [get_ports {pt_dk_p_[5]}]
set_property -dict {LOC J20} [get_ports {pt_dk_n_[5]}]
set_property -dict {LOC B21} [get_ports {pt_cs[22]}]
set_property -dict {LOC C20} [get_ports {pt_dq[37]}]
set_property -dict {LOC D22} [get_ports {pt_cs[20]}]
set_property -dict {LOC G22} [get_ports {pt_we[2]}]
set_property -dict {LOC G21} [get_ports {pt_cs[17]}]
set_property -dict {LOC J21} [get_ports {pt_cs[18]}]
set_property -dict {LOC A21} [get_ports {pt_dq[38]}]
set_property -dict {LOC C22} [get_ports {pt_dq[39]}]
set_property -dict {LOC E22} [get_ports {pt_dk_p_[4]}]
set_property -dict {LOC E23} [get_ports {pt_cs[21]}]
set_property -dict {LOC H22} [get_ports {pt_dq[36]}]
set_property -dict {LOC K21} [get_ports {pt_cs[16]}]
set_property -dict {LOC A23} [get_ports {pt_dq[42]}]
set_property -dict {LOC B22} [get_ports {pt_dq[43]}]
set_property -dict {LOC E24} [get_ports {pt_dq[41]}]
set_property -dict {LOC F23} [get_ports {pt_dq[44]}]
set_property -dict {LOC G23} [get_ports {pt_dk_n_[4]}]
set_property -dict {LOC J22} [get_ports {pt_dq[40]}]
set_property -dict {LOC B23} [get_ports {pt_dq[32]}]
set_property -dict {LOC C23} [get_ports {pt_dq[31]}]
set_property -dict {LOC D24} [get_ports {pt_dq[30]}]
set_property -dict {LOC F24} [get_ports {pt_dq[34]}]
set_property -dict {LOC H23} [get_ports {pt_dq[33]}]
set_property -dict {LOC K22} [get_ports {pt_dq[35]}]
set_property -dict {LOC A24} [get_ports {pt_dq[27]}]
set_property -dict {LOC C24} [get_ports {pt_dk_p_[3]}]
set_property -dict {LOC D25} [get_ports {pt_dk_n_[3]}]
set_property -dict {LOC F25} [get_ports {pt_dq[28]}]
set_property -dict {LOC K23} [get_ports {pt_dq[29]}]
set_property -dict {LOC A25} [get_ports {pt_cs[9]}]
set_property -dict {LOC B25} [get_ports {pt_cs[10]}]
set_property -dict {LOC D26} [get_ports {pt_we[1]}]
set_property -dict {LOC F26} [get_ports {pt_cs[15]}]
set_property -dict {LOC G25} [get_ports {pt_ref[1]}]
set_property -dict {LOC K24} [get_ports {pt_cs[11]}]
set_property -dict {LOC A26} [get_ports {pt_cs[13]}]
set_property -dict {LOC C25} [get_ports {pt_dq[18]}]
set_property -dict {LOC D27} [get_ports {pt_cs[8]}]
set_property -dict {LOC E26} [get_ports {pt_cs[12]}]
set_property -dict {LOC H25} [get_ports {pt_dq[19]}]
set_property -dict {LOC J24} [get_ports {pt_cs[14]}]
set_property -dict {LOC B26} [get_ports {pt_dq[26]}]
set_property -dict {LOC B27} [get_ports {pt_dk_n_[2]}]
set_property -dict {LOC E27} [get_ports {pt_dq[20]}]
set_property -dict {LOC G27} [get_ports {pt_dq[21]}]
set_property -dict {LOC G26} [get_ports {pt_dq[22]}]
set_property -dict {LOC J25} [get_ports {pt_dk_p_[2]}]
set_property -dict {LOC A28} [get_ports {pt_dq[15]}]
set_property -dict {LOC C27} [get_ports {pt_dq[16]}]
set_property -dict {LOC E28} [get_ports {pt_dq[17]}]
set_property -dict {LOC F28} [get_ports {pt_dq[24]}]
set_property -dict {LOC H27} [get_ports {pt_dq[25]}]
set_property -dict {LOC J26} [get_ports {pt_dq[23]}]
set_property -dict {LOC A29} [get_ports {pt_dq[11]}]
set_property -dict {LOC D29} [get_ports {pt_dq[10]}]
set_property -dict {LOC F29} [get_ports {pt_dq[14]}]
set_property -dict {LOC G28} [get_ports {pt_dq[13]}]
set_property -dict {LOC K27} [get_ports {pt_dq[12]}]
set_property -dict {LOC A30} [get_ports {pt_cs[7]}]
set_property -dict {LOC C28} [get_ports {pt_ref[0]}]
set_property -dict {LOC E29} [get_ports {pt_cs[3]}]
set_property -dict {LOC F30} [get_ports {pt_dq[9]}]
set_property -dict {LOC H29} [get_ports {pt_dk_p_[1]}]
set_property -dict {LOC J27} [get_ports {pt_dk_n_[1]}]
set_property -dict {LOC A31} [get_ports {pt_cs[4]}]
set_property -dict {LOC C29} [get_ports {pt_dq[1]}]
set_property -dict {LOC D30} [get_ports {pt_cs[6]}]
set_property -dict {LOC E31} [get_ports {pt_cs[1]}]
set_property -dict {LOC H30} [get_ports {pt_cs[2]}]
set_property -dict {LOC K28} [get_ports {pt_we[0]}]
set_property -dict {LOC B31} [get_ports {pt_dq[3]}]
set_property -dict {LOC B30} [get_ports {pt_dq[4]}]
set_property -dict {LOC D31} [get_ports {pt_dk_p_[0]}]
set_property -dict {LOC F31} [get_ports {pt_cs[5]}]
set_property -dict {LOC G31} [get_ports {pt_dq[0]}]
set_property -dict {LOC H28} [get_ports {pt_cs[0]}]
set_property -dict {LOC B32} [get_ports {pt_dq[8]}]
set_property -dict {LOC C30} [get_ports {pt_dq[6]}]
set_property -dict {LOC E32} [get_ports {pt_dq[7]}]
set_property -dict {LOC G32} [get_ports {pt_dq[5]}]
set_property -dict {LOC H32} [get_ports {pt_dk_n_[0]}]
set_property -dict {LOC J29} [get_ports {pt_dq[2]}]

set_property IOB TRUE [get_ports {pt_a[*]}]
set_property IOB TRUE [get_ports {pt_dk_p_[*]}]
set_property IOB TRUE [get_ports {pt_dk_n_[*]}]
set_property IOB TRUE [get_ports {pt_ba[*]}]
set_property IOB TRUE [get_ports {pt_cs[*]}]
set_property IOB TRUE [get_ports {pt_ref[*]}]
set_property IOB TRUE [get_ports {pt_we[*]}]
set_property IOB TRUE [get_ports {pt_dq[*]}]
#set_property IOB TRUE [all_inputs]
#set_property IOB TRUE [all_outputs]

set_property -dict {LOC A33 IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports pt_reset_rldram]
set_property -dict {LOC C32 IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_datau]
set_property -dict {LOC D32 IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_leu]
set_property -dict {LOC F33 IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_goe]
set_property -dict {LOC H33 IOSTANDARD LVCMOS12} [get_ports pt_ld]
set_property -dict {LOC G30 IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_sync]
set_property -dict {LOC B33 IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_clku]
set_property -dict {LOC J30 IOSTANDARD LVCMOS12 DRIVE 8 SLEW FAST} [get_ports ptclk_p_]
set_property -dict {LOC J31 IOSTANDARD LVCMOS12 DRIVE 8 SLEW FAST} [get_ports ptclk_n_]

set_property -dict {IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_a[*]}]
set_property -dict {IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_ba[*]}]
set_property -dict {IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_clku]

set_property -dict {IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_cs[*]}]

set_property -dict {IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_datau]

set_property -dict {IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_dk_n_[*]}]
set_property -dict {IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_dk_p_[*]}]

set_property -dict {IOSTANDARD SSTL12_T_DCI VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_dq[*]}]

set_property -dict {IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_leu]
set_property -dict {IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_ref[*]}]
set_property -dict {IOSTANDARD LVCMOS12 DRIVE 8} [get_ports pt_sync]
set_property -dict {IOSTANDARD SSTL12 VCCAUX_IO NORMAL SLEW FAST} [get_ports {pt_we[*]}]

set_property -dict {IOSTANDARD LVCMOS12 LOC L24 DRIVE 8 SLEW FAST} [get_ports clk_del]

set_property INTERNAL_VREF 0.6 [get_iobanks 17]
set_property INTERNAL_VREF 0.6 [get_iobanks 18]
set_property INTERNAL_VREF 0.6 [get_iobanks 19]
set_property INTERNAL_VREF 0.6 [get_iobanks 37]
set_property INTERNAL_VREF 0.6 [get_iobanks 38]
set_property INTERNAL_VREF 0.6 [get_iobanks 39]

set_property DCI_CASCADE {39 37} [get_iobanks 38]
set_property DCI_CASCADE {19 17} [get_iobanks 18]

set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[0].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[0].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[8].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[1].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[8].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[8].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[3].dqddr/pins[8].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[4].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[4].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[4].dqddr/pins[8].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[5].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[5].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[5].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[8].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[6].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[6].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[6].dqddr/pins[8].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[8].idelaye2_bus}]

set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[0].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[0].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[0].dqddr/pins[8].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/dq_loop[1].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[1].dqddr/pins[8].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[2].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/dq_loop[2].dqddr/pins[8].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[3].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[3].dqddr/pins[8].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[4].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[4].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[4].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/dq_loop[4].dqddr/pins[8].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[5].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[5].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[5].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[5].dqddr/pins[8].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[6].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/dq_loop[6].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[6].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/dq_loop[6].dqddr/pins[8].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[0].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[1].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[2].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[3].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[4].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[5].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[6].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[7].odelaye2_bus}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/dq_loop[7].dqddr/pins[8].odelaye2_bus}]

set_property IODELAY_GROUP IODEL_17 [get_cells {ptlut/idelayctrl_loop[0].delayctrl}]
set_property IODELAY_GROUP IODEL_18 [get_cells {ptlut/idelayctrl_loop[1].delayctrl}]
set_property IODELAY_GROUP IODEL_19 [get_cells {ptlut/idelayctrl_loop[2].delayctrl}]
set_property IODELAY_GROUP IODEL_37 [get_cells {ptlut/idelayctrl_loop[3].delayctrl}]
set_property IODELAY_GROUP IODEL_38 [get_cells {ptlut/idelayctrl_loop[4].delayctrl}]
set_property IODELAY_GROUP IODEL_39 [get_cells {ptlut/idelayctrl_loop[5].delayctrl}]

set_false_path -from [get_pins {crb/in_delay_tap_reg[*]/C}]
set_false_path -from [get_pins {crb/out_delay_tap_reg[*]/C}]
set_false_path -from [get_pins {ptlut/dq_loop[*].dqddr/pins[*].idelaye2_bus/C}]
set_false_path -from [get_pins {ptlut/dq_loop[*].dqddr/pins[*].odelaye2_bus/C}]
set_false_path -to [get_pins {ptlut/dq_loop[*].dqddr/pins[*].idelaye2_bus/CE}]
set_false_path -to [get_pins {ptlut/dq_loop[*].dqddr/pins[*].idelaye2_bus/LD}]
set_false_path -to [get_pins {ptlut/dq_loop[*].dqddr/pins[*].odelaye2_bus/CE}]
set_false_path -to [get_pins {ptlut/dq_loop[*].dqddr/pins[*].odelaye2_bus/LD}]

set_false_path -from [get_pins {bc0_aln/cnt_r_reg[*][*]/C}]
#set_false_path -from [get_pins usrclk_mmcm_/inst/mmcm_adv_inst/CLKOUT1] -to [get_pins ptlut/clk40_r_reg/D]
set_false_path -from [get_pins {crb/ddr_clk_del_reg[*]/C}] -to [get_pins {ptlut/idelaye2_clk/CNTVALUEIN[*]}]
set_false_path -from [get_pins {crb/control_reg_reg[10]/C}] -to [get_pins ptlut/idelaye2_clk/CE]
set_false_path -from [get_pins {crb/control_reg_reg[12]/C}] -to [get_pins ptlut/idelaye2_clk/LD]
