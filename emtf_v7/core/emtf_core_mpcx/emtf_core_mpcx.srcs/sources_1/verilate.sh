FILES="\
./core/prim_conv.sv \
./core/sort_sector.sv \
./core/sp.sv \
./core/ph_pattern_sector.sv \
./core/two_mu.sv \
./core/extend_sector.sv \
./core/sort_zone.sv \
./core/zones.sv \
./core/best_tracks.sv \
./core/find_segment.sv \
./core/prim_conv11.sv \
./core/prim_conv_sector.sv \
./core/match_ph_segments.sv \
./core/deltas_sector.sv \
./core/coord_delay.sv \
./core/ph_pattern.sv \
./core/zone_best3.sv \
./core/extender.sv \
./core/ptlut_address.sv \
./core/deltas.sv \
./core/single.sv \
./core/best_delta.sv \
./cppf/rx_deframer.sv \
./cppf/cppf_links.sv \
./mbld/sv/assign_mgt_tx.sv \
./mbld/sv/common_module.sv \
./mbld/sv/quad_module.sv \
./mbld/sv/mgt_interfaces.sv \
./mbld/sv/assign_mgt_rx.sv \
./mbld/sv/emtf_serial_io.sv \
./mbld/sv/mgt_module.sv \
./mbld/sv_manual/drp_mux.sv \
./mbld/sv_manual/drp_mux_fpga.sv \
./nn/pat_2_bend.sv \
./nn/nn_tux.sv \
./mpcx/tx/tx_reclock.sv \
./mpcx/tx/mpcx_tx.sv \
./mpcx/tx/mpc_scrambler.sv \
./mpcx/rx/mpcx_aligner_id2_9.sv \
./mpcx/rx/emtf_mpcx_rx_all.sv \
./mpcx/rx/emtf_mpcx_rx.sv \
./mpcx/rx/dyn_shift.sv \
./mpcx/rx/mpcx_rx.sv \
./mpcx/rx/mpcx_deformatter.sv \
./mpcx/rx/mpc_descrambler.sv \
./mpcx/rx/mpcx_deformatter_neighbor.sv \
./mpcx/rx/mpcx_aligner_id1.sv \
./mpcx/rx/rx_reclock.sv \
./services/clock_control.sv \
./services/dq_ddr_iodel.sv \
./services/emtf_core_top.sv \
./services/crc_ol.sv \
./services/amc13_link_tx_top.sv \
./services/led_driver.sv \
./services/mtf7_daq.sv \
./services/blk_mem.sv \
./services/output_delay.sv \
./services/clock_sync_detect.sv \
./services/axi_or_mux.sv \
./services/valid_delay.sv \
./services/tx_crc.sv \
./services/core_params_axi.sv \
./services/dyn_shift.sv \
./services/mpc_spy_mem_axi.sv \
./services/dbg.sv \
./services/gmt_tx_reclock.sv \
./services/control_to_core_axi.sv \
./services/output_formatter.sv \
./services/dbg_probes_switch.sv \
./services/mtf7_ptlut.sv \
./services/register_bank.sv \
./services/inject_mem_axi.sv \
./gem/gem_aligner.sv \
./gem/gem_rx.sv \
./gem/prim_conv_sector_ge11.sv \
./gem/prim_conv_ge11.sv \
./shower/shower.sv"


INCLUDE="\
-I../sim_1/new/ \
-I../sim_1/imports/emtf_core_2019-02-12/ \
-Icore/ \
-Impcx/ \
-Imbld/sv/ \
-Imbld/sv_manual/ \
-Iservices/"

verilator $INCLUDE -Wall --lint-only $FILES