// This code was automatically generated by FPGA MGT Builder
// Timestamp: 2021-02-19 13:07:32.072
// User: madorsky
// FPGA MGT builder homepage: <link>

`include "drp_interface.sv"
`include "mgt_interfaces.sv"
module emtf_serial_io
(
	drp.in drp_fif,
	input drpclk,
	input [15:0] refclk_p,
	input [15:0] refclk_n,
	mgt_rx.in mpc2_rx [7:0],
	mgt_rx.in ge11_rx [6:0],
	mgt_rx.in mpc3_rx [7:0],
	mgt_rx.in mpc4_rx [7:0],
	mgt_rx.in cppf_rx [6:0],
	mgt_rx.in mpc1_rx [7:0],
	mgt_rx.in mpc0_rx [7:0],
	mgt_rx.in mpcn_rx [8:0],
	mgt_tx.in gmt_tx [1:0],
	mgt_tx.in daq_tx [0:0],
	output CPPF_3_mmcm_clk,
	output DAQ_0_mmcm_clk,
	output CPPF_7_mmcm_clk,
	output clk125_nob
);
	localparam quadn = 18;
	drp #(.AW(12)) drp_qif [quadn-1:0]();
	drp_mux_fpga #(.N(quadn), .AW_QUAD(12)) drpm (drp_qif, drp_fif, drpclk);

	mgt_tx mgt_tx_if [quadn-1:0][3:0]();
	mgt_rx mgt_rx_if [quadn-1:0][3:0]();
	wire [ 3:0] mgt_gtrefclk0 [quadn-1:0];
	wire [ 3:0] mgt_txusrclk [quadn-1:0];
	wire        com_refclkoutmonitor [quadn-1:0];
	wire        com_gtrefclk0 [quadn-1:0];
	wire [15:0] refclk;
	genvar gi;
	generate
		for (gi = 0; gi < quadn; gi++)
		begin: quad_loop
			GTHE2_QUAD #(.ind(gi)) GTHE2_QUAD_inst
			(
				.drp_qif (drp_qif [gi]),
				.drpclk (drpclk),
				.mgt_tx_if (mgt_tx_if [gi]),
				.mgt_rx_if (mgt_rx_if [gi]),
				.mgt_gtrefclk0              (mgt_gtrefclk0              [gi]),
				.mgt_txusrclk               (mgt_txusrclk               [gi]),
				.com_refclkoutmonitor       (com_refclkoutmonitor       [gi]),
				.com_gtrefclk0              (com_gtrefclk0              [gi])
			);
		end
		for (gi = 0; gi < 16; gi++)
		begin: refclk_loop
			IBUFDS_GTE2 refclk_buf
			(
			    .O     (refclk   [gi]),
			    .ODIV2 (),
			    .CEB   (1'b0),
			    .I     (refclk_p [gi]),
			    .IB    (refclk_n [gi])
			);
		end
	endgenerate
	assign_mgt_rx ari0 (mgt_rx_if [0][2], ge11_rx [6]);
	assign_mgt_rx ari1 (mgt_rx_if [1][0], ge11_rx [2]);
	assign_mgt_rx ari2 (mgt_rx_if [1][2], ge11_rx [3]);
	assign_mgt_rx ari3 (mgt_rx_if [2][0], mpcn_rx [7]);
	assign_mgt_rx ari4 (mgt_rx_if [2][1], mpcn_rx [6]);
	assign_mgt_rx ari5 (mgt_rx_if [2][2], mpcn_rx [2]);
	assign_mgt_rx ari6 (mgt_rx_if [2][3], mpcn_rx [3]);
	assign_mgt_rx ari7 (mgt_rx_if [3][1], cppf_rx [1]);
	assign_mgt_rx ari8 (mgt_rx_if [3][2], cppf_rx [2]);
	assign_mgt_rx ari9 (mgt_rx_if [3][3], mpc4_rx [7]);
	assign_mgt_rx ari10 (mgt_rx_if [4][0], cppf_rx [0]);
	assign_mgt_rx ari11 (mgt_rx_if [4][1], mpc4_rx [3]);
	assign_mgt_rx ari12 (mgt_rx_if [4][2], mpc4_rx [6]);
	assign_mgt_rx ari13 (mgt_rx_if [4][3], mpc3_rx [7]);
	assign_mgt_rx ari14 (mgt_rx_if [5][0], mpc4_rx [2]);
	assign_mgt_rx ari15 (mgt_rx_if [5][1], mpc3_rx [3]);
	assign_mgt_rx ari16 (mgt_rx_if [5][2], mpc3_rx [6]);
	assign_mgt_rx ari17 (mgt_rx_if [5][3], mpc2_rx [7]);
	assign_mgt_rx ari18 (mgt_rx_if [6][0], mpc3_rx [2]);
	assign_mgt_rx ari19 (mgt_rx_if [6][1], mpc2_rx [3]);
	assign_mgt_rx ari20 (mgt_rx_if [6][2], mpc2_rx [6]);
	assign_mgt_rx ari21 (mgt_rx_if [6][3], mpc1_rx [7]);
	assign_mgt_tx ati21 (mgt_tx_if [6][3], gmt_tx [0]);
	assign_mgt_rx ari22 (mgt_rx_if [7][0], mpc2_rx [2]);
	assign_mgt_rx ari23 (mgt_rx_if [7][1], mpc1_rx [3]);
	assign_mgt_rx ari24 (mgt_rx_if [7][2], mpc1_rx [6]);
	assign_mgt_rx ari25 (mgt_rx_if [7][3], mpc0_rx [7]);
	assign_mgt_rx ari26 (mgt_rx_if [8][0], mpc1_rx [2]);
	assign_mgt_rx ari27 (mgt_rx_if [8][1], mpc0_rx [6]);
	assign_mgt_rx ari28 (mgt_rx_if [8][2], mpc0_rx [3]);
	assign_mgt_rx ari29 (mgt_rx_if [8][3], mpc0_rx [2]);
	assign_mgt_tx ati30 (mgt_tx_if [9][0], daq_tx [0]);
	assign_mgt_rx ari31 (mgt_rx_if [9][2], ge11_rx [5]);
	assign_mgt_rx ari32 (mgt_rx_if [9][3], ge11_rx [4]);
	assign_mgt_rx ari33 (mgt_rx_if [10][0], ge11_rx [1]);
	assign_mgt_rx ari34 (mgt_rx_if [10][1], ge11_rx [0]);
	assign_mgt_rx ari35 (mgt_rx_if [10][2], mpcn_rx [8]);
	assign_mgt_rx ari36 (mgt_rx_if [11][0], mpcn_rx [4]);
	assign_mgt_rx ari37 (mgt_rx_if [11][1], mpcn_rx [5]);
	assign_mgt_rx ari38 (mgt_rx_if [11][2], mpcn_rx [0]);
	assign_mgt_rx ari39 (mgt_rx_if [11][3], mpcn_rx [1]);
	assign_mgt_rx ari40 (mgt_rx_if [12][0], cppf_rx [3]);
	assign_mgt_rx ari41 (mgt_rx_if [12][1], cppf_rx [4]);
	assign_mgt_rx ari42 (mgt_rx_if [12][2], cppf_rx [5]);
	assign_mgt_rx ari43 (mgt_rx_if [12][3], cppf_rx [6]);
	assign_mgt_rx ari44 (mgt_rx_if [13][0], mpc4_rx [5]);
	assign_mgt_rx ari45 (mgt_rx_if [13][1], mpc4_rx [4]);
	assign_mgt_rx ari46 (mgt_rx_if [13][2], mpc4_rx [1]);
	assign_mgt_rx ari47 (mgt_rx_if [13][3], mpc4_rx [0]);
	assign_mgt_rx ari48 (mgt_rx_if [14][0], mpc3_rx [5]);
	assign_mgt_rx ari49 (mgt_rx_if [14][1], mpc3_rx [4]);
	assign_mgt_rx ari50 (mgt_rx_if [14][2], mpc3_rx [1]);
	assign_mgt_rx ari51 (mgt_rx_if [14][3], mpc3_rx [0]);
	assign_mgt_rx ari52 (mgt_rx_if [15][0], mpc2_rx [5]);
	assign_mgt_rx ari53 (mgt_rx_if [15][1], mpc2_rx [4]);
	assign_mgt_rx ari54 (mgt_rx_if [15][2], mpc2_rx [1]);
	assign_mgt_rx ari55 (mgt_rx_if [15][3], mpc2_rx [0]);
	assign_mgt_rx ari56 (mgt_rx_if [16][0], mpc1_rx [5]);
	assign_mgt_rx ari57 (mgt_rx_if [16][1], mpc1_rx [4]);
	assign_mgt_rx ari58 (mgt_rx_if [16][2], mpc1_rx [1]);
	assign_mgt_rx ari59 (mgt_rx_if [16][3], mpc1_rx [0]);
	assign_mgt_rx ari60 (mgt_rx_if [17][0], mpc0_rx [5]);
	assign_mgt_tx ati60 (mgt_tx_if [17][0], gmt_tx [1]);
	assign_mgt_rx ari61 (mgt_rx_if [17][1], mpc0_rx [1]);
	assign_mgt_rx ari62 (mgt_rx_if [17][2], mpc0_rx [4]);
	assign_mgt_rx ari63 (mgt_rx_if [17][3], mpc0_rx [0]);
	assign com_gtrefclk0 [0] = refclk [12]; // ge11_rx 6
	assign com_gtrefclk0 [1] = refclk [13]; // ge11_rx 2
	assign com_gtrefclk0 [1] = refclk [13]; // ge11_rx 3
	assign mgt_gtrefclk0 [2][0] = refclk [13]; // mpcn_rx 7
	assign mgt_gtrefclk0 [2][1] = refclk [13]; // mpcn_rx 6
	assign mgt_gtrefclk0 [2][2] = refclk [13]; // mpcn_rx 2
	assign mgt_gtrefclk0 [2][3] = refclk [13]; // mpcn_rx 3
	assign com_gtrefclk0 [3] = refclk [5]; // cppf_rx 1
	assign com_gtrefclk0 [3] = refclk [5]; // cppf_rx 2
	assign mgt_gtrefclk0 [3][3] = refclk [13]; // mpc4_rx 7
	assign com_gtrefclk0 [4] = refclk [6]; // cppf_rx 0
	assign mgt_gtrefclk0 [4][1] = refclk [14]; // mpc4_rx 3
	assign mgt_gtrefclk0 [4][2] = refclk [14]; // mpc4_rx 6
	assign mgt_gtrefclk0 [4][3] = refclk [14]; // mpc3_rx 7
	assign mgt_gtrefclk0 [5][0] = refclk [14]; // mpc4_rx 2
	assign mgt_gtrefclk0 [5][1] = refclk [14]; // mpc3_rx 3
	assign mgt_gtrefclk0 [5][2] = refclk [14]; // mpc3_rx 6
	assign mgt_gtrefclk0 [5][3] = refclk [14]; // mpc2_rx 7
	assign mgt_gtrefclk0 [6][0] = refclk [15]; // mpc3_rx 2
	assign mgt_gtrefclk0 [6][1] = refclk [15]; // mpc2_rx 3
	assign mgt_gtrefclk0 [6][2] = refclk [15]; // mpc2_rx 6
	assign com_gtrefclk0 [6] = refclk [7]; // gmt_tx 0
	assign mgt_gtrefclk0 [6][3] = refclk [15]; // mpc1_rx 7
	assign mgt_gtrefclk0 [7][0] = refclk [15]; // mpc2_rx 2
	assign mgt_gtrefclk0 [7][1] = refclk [15]; // mpc1_rx 3
	assign mgt_gtrefclk0 [7][2] = refclk [15]; // mpc1_rx 6
	assign mgt_gtrefclk0 [7][3] = refclk [15]; // mpc0_rx 7
	assign mgt_gtrefclk0 [8][0] = refclk [15]; // mpc1_rx 2
	assign mgt_gtrefclk0 [8][1] = refclk [15]; // mpc0_rx 6
	assign mgt_gtrefclk0 [8][2] = refclk [15]; // mpc0_rx 3
	assign mgt_gtrefclk0 [8][3] = refclk [15]; // mpc0_rx 2
	assign mgt_gtrefclk0 [9][0] = refclk [0]; // daq_tx 0
	assign com_gtrefclk0 [9] = refclk [8]; // ge11_rx 5
	assign com_gtrefclk0 [9] = refclk [8]; // ge11_rx 4
	assign com_gtrefclk0 [10] = refclk [9]; // ge11_rx 1
	assign com_gtrefclk0 [10] = refclk [9]; // ge11_rx 0
	assign mgt_gtrefclk0 [10][2] = refclk [9]; // mpcn_rx 8
	assign mgt_gtrefclk0 [11][0] = refclk [9]; // mpcn_rx 4
	assign mgt_gtrefclk0 [11][1] = refclk [9]; // mpcn_rx 5
	assign mgt_gtrefclk0 [11][2] = refclk [9]; // mpcn_rx 0
	assign mgt_gtrefclk0 [11][3] = refclk [9]; // mpcn_rx 1
	assign com_gtrefclk0 [12] = refclk [1]; // cppf_rx 3
	assign com_gtrefclk0 [12] = refclk [1]; // cppf_rx 4
	assign com_gtrefclk0 [12] = refclk [1]; // cppf_rx 5
	assign com_gtrefclk0 [12] = refclk [1]; // cppf_rx 6
	assign mgt_gtrefclk0 [13][0] = refclk [10]; // mpc4_rx 5
	assign mgt_gtrefclk0 [13][1] = refclk [10]; // mpc4_rx 4
	assign mgt_gtrefclk0 [13][2] = refclk [10]; // mpc4_rx 1
	assign mgt_gtrefclk0 [13][3] = refclk [10]; // mpc4_rx 0
	assign mgt_gtrefclk0 [14][0] = refclk [10]; // mpc3_rx 5
	assign mgt_gtrefclk0 [14][1] = refclk [10]; // mpc3_rx 4
	assign mgt_gtrefclk0 [14][2] = refclk [10]; // mpc3_rx 1
	assign mgt_gtrefclk0 [14][3] = refclk [10]; // mpc3_rx 0
	assign mgt_gtrefclk0 [15][0] = refclk [11]; // mpc2_rx 5
	assign mgt_gtrefclk0 [15][1] = refclk [11]; // mpc2_rx 4
	assign mgt_gtrefclk0 [15][2] = refclk [11]; // mpc2_rx 1
	assign mgt_gtrefclk0 [15][3] = refclk [11]; // mpc2_rx 0
	assign mgt_gtrefclk0 [16][0] = refclk [11]; // mpc1_rx 5
	assign mgt_gtrefclk0 [16][1] = refclk [11]; // mpc1_rx 4
	assign mgt_gtrefclk0 [16][2] = refclk [11]; // mpc1_rx 1
	assign mgt_gtrefclk0 [16][3] = refclk [11]; // mpc1_rx 0
	assign com_gtrefclk0 [17] = refclk [3]; // gmt_tx 1
	assign mgt_gtrefclk0 [17][0] = refclk [11]; // mpc0_rx 5
	assign mgt_gtrefclk0 [17][1] = refclk [11]; // mpc0_rx 1
	assign mgt_gtrefclk0 [17][2] = refclk [11]; // mpc0_rx 4
	assign mgt_gtrefclk0 [17][3] = refclk [11]; // mpc0_rx 0
	BUFG CPPF_3_inst (.O(CPPF_3_mmcm_clk), .I(mgt_tx_if[17][0].txoutclk));
	assign mgt_txusrclk[17][0] = CPPF_3_mmcm_clk; // gmt_tx1
	BUFG DAQ_0_inst (.O(DAQ_0_mmcm_clk), .I(mgt_tx_if[9][0].txoutclk));
	assign mgt_txusrclk[9][0] = DAQ_0_mmcm_clk; // daq_tx0
	BUFG CPPF_7_inst (.O(CPPF_7_mmcm_clk), .I(mgt_tx_if[6][3].txoutclk));
	assign mgt_txusrclk[6][3] = CPPF_7_mmcm_clk; // gmt_tx0
	assign clk125_nob = refclk[2]; // unused refclk for fabric
endmodule
