set_property PACKAGE_PIN H12 [get_ports k_rx_clk]

set_property PACKAGE_PIN B11 [get_ports {k_rxdata[0]}]
set_property PACKAGE_PIN B14 [get_ports {k_rxdata[1]}]
set_property PACKAGE_PIN A14 [get_ports {k_rxdata[2]}]
set_property PACKAGE_PIN B10 [get_ports {k_rxdata[3]}]
set_property PACKAGE_PIN A10 [get_ports {k_rxdata[4]}]
set_property PACKAGE_PIN B15 [get_ports {k_rxdata[5]}]
set_property PACKAGE_PIN A15 [get_ports {k_rxdata[6]}]
set_property PACKAGE_PIN A13 [get_ports {k_rxdata[7]}]
set_property PACKAGE_PIN A12 [get_ports {k_rxdata[8]}]
set_property PACKAGE_PIN J14 [get_ports {k_rxdata[9]}]
set_property PACKAGE_PIN N16 [get_ports {k_rxdata[10]}]
set_property PACKAGE_PIN K25 [get_ports {k_rxdata[11]}]
set_property PACKAGE_PIN K26 [get_ports {k_rxdata[12]}]
set_property PACKAGE_PIN R26 [get_ports {k_rxdata[13]}]
set_property PACKAGE_PIN P26 [get_ports {k_rxdata[14]}]
set_property PACKAGE_PIN M25 [get_ports {k_rxdata[15]}]
set_property PACKAGE_PIN L25 [get_ports {k_rxcharisk[0]}]
set_property PACKAGE_PIN P24 [get_ports {k_rxcharisk[1]}]
set_property PACKAGE_PIN N24 [get_ports {k_rxchariscomma[0]}]
set_property PACKAGE_PIN N26 [get_ports {k_rxchariscomma[1]}]
set_property PACKAGE_PIN M26 [get_ports {k_rxnotintable[0]}]
set_property PACKAGE_PIN R25 [get_ports {k_rxnotintable[1]}]
set_property PACKAGE_PIN P25 [get_ports k_rxresetdone]

set_property IOSTANDARD LVCMOS12 [get_ports k_rx*]

set_property IOB TRUE [get_ports {k_rxdata[*]}]
set_property IOB TRUE [get_ports {k_rxcharisk[*]}]
set_property IOB TRUE [get_ports {k_rxchariscomma[*]}]
set_property IOB TRUE [get_ports {k_rxnotintable[*]}]
set_property IOB TRUE [get_ports k_rxresetdone]

set_property LOC GTXE2_CHANNEL_X0Y1 [get_cells daq_link_rx/daq_link_rx_init_i/daq_link_rx_i/gt0_daq_link_rx_i/gtxe2_i]

