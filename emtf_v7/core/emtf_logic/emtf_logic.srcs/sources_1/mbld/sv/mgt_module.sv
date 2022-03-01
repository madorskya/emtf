// This code was automatically generated by FPGA MGT Builder
// Timestamp: 2021-02-19 13:07:32.072
// User: madorsky
// FPGA MGT builder homepage: <link>

`include "drp_interface.sv"
`include "mgt_interfaces.sv"
module GTHE2_CHANNEL_tux
#(parameter [7:0] qind = 0, parameter [7:0] mind = 0)
(
	drp.in drp_if,
	mgt_tx.in mgt_tx_if,
	mgt_rx.in mgt_rx_if,
	input         cplllockdetclk,
	input         drpclk,
	input         dmonitorclk,
	input         gtrefclk0,
	input         qpllclk,
	input         qpllrefclk,
	output        rxphaligndone,
	input         rxsyncallin,
	input         rxusrclk,
	input         rxusrclk2,
	input         txusrclk,
	input         txusrclk2
);
`include "xymap.sv"
	wire [15:0] XY = mgtxy[qind][mind];
	reg  [31:0] reg_  [ 4: 0];
	wire [31:0] wire_ [ 6: 5];

    // manual addition: power down everything by default 
    initial
    begin
       reg_[0][5] = 1'b1;
       reg_[0][7:6] = 2'b11;
       reg_[0][10:9] = 2'b11;
    end

    reg         int_reg_rdy;
    reg  [31:0] drpdo_reg;
    wire        drprdy_mgt;
    wire [31:0] drpdo_mgt;
    reg         drprdy_reg;
    assign drp_if.drprdy = drprdy_reg;
    assign drp_if.drpdo  = drpdo_reg;
    always @(posedge drpclk)
    begin
        drprdy_reg = 1'b0;
		drpdo_reg = 32'h0;
        if (drp_if.int_reg == 1'b1)
        begin
            if (drp_if.drpwe == 1'b1)
            begin
                case (drp_if.drpaddr)

                    9'd0: reg_[0] = drp_if.drpdi;
                    9'd1: reg_[1] = drp_if.drpdi;
                    9'd2: reg_[2] = drp_if.drpdi;
                    9'd3: reg_[3] = drp_if.drpdi;
                    9'd4: reg_[4] = drp_if.drpdi;
                endcase
                drprdy_reg = 1'b1;
            end
            else
            begin
                case (drp_if.drpaddr)

                    9'd0: drpdo_reg = reg_[0];
                    9'd1: drpdo_reg = reg_[1];
                    9'd2: drpdo_reg = reg_[2];
                    9'd3: drpdo_reg = reg_[3];
                    9'd4: drpdo_reg = reg_[4];
                    9'd5: drpdo_reg = wire_[5];
                    9'd6: drpdo_reg = wire_[6];
                    9'h1ff: drpdo_reg = XY; // each MGT reports its XY
                endcase
                drprdy_reg = 1'b1;
            end
        end

        if (drprdy_mgt == 1'b1)
        begin
            drpdo_reg = drpdo_mgt;
            drprdy_reg = 1'b1;
        end
    end

	BUFH rxoutclk_buf (.O(mgt_rx_if.rxoutclk), .I(rxoutclk_loc));
	GTHE2_CHANNEL GTHE2_CHANNEL_inst
	(
		.CPLLFBCLKLOST              (wire_[5][ 0: 0]),
		.CPLLLOCK                   (wire_[5][ 1: 1]),
		.CPLLLOCKDETCLK             (cplllockdetclk            ),
		.CPLLLOCKEN                 (1'b1),
		.CPLLREFCLKLOST             (wire_[5][ 2: 2]),
		.CPLLREFCLKSEL              (3'b001),
		.CPLLRESET                  ( reg_[0][ 0: 0]),
		.GTRSVD                     (16'b0),
		.PCSRSVDIN                  (16'b0),
		.PCSRSVDIN2                 (5'b0),
		.PMARSVDIN                  (5'b0),
		.TSTIN                      (20'hfffff),
		.DRPADDR                    (drp_if.drpaddr            ),
		.DRPCLK                     (drpclk                    ),
		.DRPDI                      (drp_if.drpdi [15:0]),
		.DRPDO                      (drpdo_mgt [15:0]),
		.DRPEN                      (drp_if.drpen              ),
		.DRPRDY                     (drprdy_mgt),
		.DRPWE                      (drp_if.drpwe              ),
		.GTRESETSEL                 ( reg_[0][ 1: 1]),
		.RESETOVRD                  (1'b0),
		.LOOPBACK                   ( reg_[0][ 4: 2]),
		.DMONFIFORESET              (1'b0),
		.DMONITORCLK                (dmonitorclk               ),
		.DMONITOROUT                (wire_[5][17: 3]),
		.CPLLPD                     ( reg_[0][ 5: 5]),
		.RXPD                       ( reg_[0][ 7: 6]),
		.RXPHDLYPD                  ( reg_[0][ 8: 8]),
		.TXDIFFPD                   (1'b0),
		.TXPD                       ( reg_[0][10: 9]),
		.TXPDELECIDLEMODE           ( reg_[0][11:11]),
		.TXPHDLYPD                  ( reg_[0][12:12]),
		.GTGREFCLK                  (1'b0),
		.GTNORTHREFCLK0             (1'b0),
		.GTNORTHREFCLK1             (1'b0),
		.GTREFCLK0                  (gtrefclk0                 ),
		.GTREFCLK1                  (1'b0),
		.GTREFCLKMONITOR            (),
		.GTSOUTHREFCLK0             (1'b0),
		.GTSOUTHREFCLK1             (1'b0),
		.QPLLCLK                    (qpllclk                   ),
		.QPLLREFCLK                 (qpllrefclk                ),
		.RXSYSCLKSEL                ( reg_[0][14:13]),
		.TXSYSCLKSEL                ( reg_[0][16:15]),
		.RX8B10BEN                  ( reg_[0][17:17]),
		.RXCHARISCOMMA              (mgt_rx_if.rxchariscomma   ),
		.RXCHARISK                  (mgt_rx_if.rxcharisk       ),
		.RXDISPERR                  (mgt_rx_if.rxdisperr       ),
		.RXNOTINTABLE               (mgt_rx_if.rxnotintable    ),
		.SETERRSTATUS               (1'b0),
		.GTHRXN                     (mgt_rx_if.gthrxn          ),
		.GTHRXP                     (mgt_rx_if.gthrxp          ),
		.RXQPIEN                    ( reg_[0][18:18]),
		.RXQPISENN                  (wire_[5][18:18]),
		.RXQPISENP                  (wire_[5][19:19]),
		.RXBYTEISALIGNED            (wire_[5][20:20]),
		.RXBYTEREALIGN              (wire_[5][21:21]),
		.RXCOMMADET                 (mgt_rx_if.rxcommadet      ),
		.RXCOMMADETEN               ( reg_[0][19:19]),
		.RXMCOMMAALIGNEN            ( reg_[0][20:20]),
		.RXPCOMMAALIGNEN            ( reg_[0][21:21]),
		.RXSLIDE                    (mgt_rx_if.rxslide         ),
		.RXCHANBONDSEQ              (mgt_rx_if.rxchanbondseq   ),
		.RXCHANISALIGNED            (mgt_rx_if.rxchanisaligned ),
		.RXCHANREALIGN              (mgt_rx_if.rxchanrealign   ),
		.RXCHBONDEN                 ( reg_[0][22:22]),
		.RXCHBONDI                  (mgt_rx_if.rxchbondi       ),
		.RXCHBONDLEVEL              ( reg_[0][25:23]),
		.RXCHBONDMASTER             ( reg_[0][26:26]),
		.RXCHBONDO                  (mgt_rx_if.rxchbondo       ),
		.RXCHBONDSLAVE              ( reg_[0][27:27]),
		.RXDDIEN                    ( reg_[0][28:28]),
		.RXDLYBYPASS                ( reg_[0][29:29]),
		.RXDLYEN                    ( reg_[0][30:30]),
		.RXDLYOVRDEN                (1'b0),
		.RXDLYSRESET                ( reg_[0][31:31]),
		.RXDLYSRESETDONE            (rxdlysresetdone           ),
		.RXPHALIGN                  ( reg_[1][ 0: 0]),
		.RXPHALIGNDONE              (rxphaligndone             ),
		.RXPHALIGNEN                ( reg_[1][ 1: 1]),
		.RXPHDLYRESET               ( reg_[1][ 2: 2]),
		.RXPHMONITOR                (wire_[5][27:23]),
		.RXPHOVRDEN                 ( reg_[1][ 3: 3]),
		.RXPHSLIPMONITOR            (wire_[6][ 4: 0]),
		.RXSYNCALLIN                (rxsyncallin               ),
		.RXSYNCDONE                 (wire_[6][ 5: 5]),
		.RXSYNCIN                   (mgt_rx_if.rxsyncin        ),
		.RXSYNCMODE                 ( reg_[1][ 4: 4]),
		.RXSYNCOUT                  (mgt_rx_if.rxsyncout       ),
		.RXBUFSTATUS                (wire_[6][ 8: 6]),
		.RXCDRHOLD                  ( reg_[1][ 5: 5]),
		.RXCDRLOCK                  (),
		.RXCDROVRDEN                ( reg_[1][ 6: 6]),
		.RXCDRRESETRSV              (1'b0),
		.RXRATE                     ( reg_[1][ 9: 7]),
		.RXCLKCORCNT                (mgt_rx_if.rxclkcorcnt     ),
		.RXADAPTSELTEST             (14'b0),
		.RXDFEAGCHOLD               ( reg_[1][10:10]),
		.RXDFEAGCOVRDEN             ( reg_[1][11:11]),
		.RXDFEAGCTRL                (5'b10000),
		.RXDFECM1EN                 (1'b0),
		.RXDFELFHOLD                ( reg_[1][12:12]),
		.RXDFELFOVRDEN              ( reg_[1][13:13]),
		.RXDFESLIDETAP              (5'b0),
		.RXDFESLIDETAPADAPTEN       (1'b0),
		.RXDFESLIDETAPHOLD          (1'b0),
		.RXDFESLIDETAPID            (6'b0),
		.RXDFESLIDETAPINITOVRDEN    (1'b0),
		.RXDFESLIDETAPONLYADAPTEN   (1'b0),
		.RXDFESLIDETAPOVRDEN        (1'b0),
		.RXDFESLIDETAPSTARTED       (),
		.RXDFESLIDETAPSTROBE        (1'b0),
		.RXDFESLIDETAPSTROBEDONE    (),
		.RXDFESLIDETAPSTROBESTARTED (),
		.RXDFESTADAPTDONE           (),
		.RXDFETAP2HOLD              (1'b0),
		.RXDFETAP2OVRDEN            (1'b0),
		.RXDFETAP3HOLD              (1'b0),
		.RXDFETAP3OVRDEN            (1'b0),
		.RXDFETAP4HOLD              (1'b0),
		.RXDFETAP4OVRDEN            (1'b0),
		.RXDFETAP5HOLD              (1'b0),
		.RXDFETAP5OVRDEN            (1'b0),
		.RXDFETAP6HOLD              (1'b0),
		.RXDFETAP6OVRDEN            (1'b0),
		.RXDFETAP7HOLD              (1'b0),
		.RXDFETAP7OVRDEN            (1'b0),
		.RXDFEUTHOLD                (1'b0),
		.RXDFEUTOVRDEN              (1'b0),
		.RXDFEVPHOLD                (1'b0),
		.RXDFEVPOVRDEN              (1'b0),
		.RXDFEVSEN                  (1'b0),
		.RXDFEXYDEN                 (1'b1),
		.RXLPMEN                    ( reg_[1][14:14]),
		.RXLPMHFHOLD                (1'b0),
		.RXLPMHFOVRDEN              (1'b0),
		.RXLPMLFHOLD                (1'b0),
		.RXLPMLFKLOVRDEN            (1'b0),
		.RXMONITOROUT               (),
		.RXMONITORSEL               (2'b0),
		.RXOSHOLD                   (1'b0),
		.RXOSINTCFG                 (4'b0110),
		.RXOSINTEN                  (1'b1),
		.RXOSINTHOLD                (1'b0),
		.RXOSINTID0                 (4'b0),
		.RXOSINTNTRLEN              (1'b0),
		.RXOSINTOVRDEN              (1'b0),
		.RXOSINTSTARTED             (),
		.RXOSINTSTROBE              (1'b0),
		.RXOSINTSTROBEDONE          (),
		.RXOSINTSTROBESTARTED       (),
		.RXOSINTTESTOVRDEN          (1'b0),
		.RXOSOVRDEN                 (1'b0),
		.EYESCANDATAERROR           (wire_[6][ 9: 9]),
		.EYESCANMODE                (1'b0),
		.EYESCANTRIGGER             ( reg_[1][15:15]),
		.RXOUTCLK                   (rxoutclk_loc              ),
		.RXOUTCLKFABRIC             (),
		.RXOUTCLKPCS                (),
		.RXOUTCLKSEL                ( reg_[1][18:16]),
		.RXRATEDONE                 (wire_[6][10:10]),
		.RXDATAVALID                (mgt_rx_if.rxdatavalid     ),
		.RXGEARBOXSLIP              (mgt_rx_if.rxgearboxslip   ),
		.RXHEADER                   (mgt_rx_if.rxheader        ),
		.RXHEADERVALID              (mgt_rx_if.rxheadervalid   ),
		.RXSTARTOFSEQ               (wire_[6][12:11]),
		.RXDATA                     (mgt_rx_if.rxdata          ),
		.RXUSRCLK                   (rxusrclk                  ),
		.RXUSRCLK2                  (rxusrclk2                 ),
		.SIGVALIDCLK                (1'b0),
		.RXCOMINITDET               (mgt_rx_if.rxcominitdet    ),
		.RXCOMSASDET                (mgt_rx_if.rxcomsasdet     ),
		.RXCOMWAKEDET               (mgt_rx_if.rxcomwakedet    ),
		.RXELECIDLE                 (wire_[6][13:13]),
		.RXELECIDLEMODE             ( reg_[1][20:19]),
		.RXVALID                    (mgt_rx_if.rxvalid         ),
		.RXPOLARITY                 ( reg_[1][21:21]),
		.RXPRBSCNTRESET             ( reg_[1][22:22]),
		.RXPRBSERR                  (rxprbserr                 ),
		.RXPRBSSEL                  ( reg_[1][25:23]),
		.EYESCANRESET               ( reg_[1][26:26]),
		.GTRXRESET                  ( reg_[1][27:27]),
		.RSOSINTDONE                (),
		.RXBUFRESET                 ( reg_[1][28:28]),
		.RXCDRFREQRESET             (1'b0),
		.RXCDRRESET                 (1'b0),
		.RXDFELPMRESET              ( reg_[1][29:29]),
		.RXOOBRESET                 (1'b0),
		.RXOSCALRESET               (1'b0),
		.RXPCSRESET                 ( reg_[1][30:30]),
		.RXPMARESET                 ( reg_[1][31:31]),
		.RXPMARESETDONE             (wire_[6][15:15]),
		.RXRESETDONE                (wire_[6][16:16]),
		.RXUSERRDY                  ( reg_[2][ 0: 0]),
		.TX8B10BBYPASS              ( reg_[2][ 8: 1]),
		.TX8B10BEN                  ( reg_[2][ 9: 9]),
		.TXCHARISK                  (mgt_tx_if.txcharisk       ),
		.TXBUFSTATUS                (wire_[6][18:17]),
		.TXDLYBYPASS                ( reg_[2][10:10]),
		.TXDLYEN                    ( reg_[2][11:11]),
		.TXDLYHOLD                  ( reg_[2][12:12]),
		.TXDLYOVRDEN                ( reg_[2][13:13]),
		.TXDLYSRESET                ( reg_[2][14:14]),
		.TXDLYSRESETDONE            (wire_[6][19:19]),
		.TXDLYUPDOWN                ( reg_[2][15:15]),
		.TXPHALIGN                  ( reg_[2][16:16]),
		.TXPHALIGNDONE              (wire_[6][20:20]),
		.TXPHALIGNEN                ( reg_[2][17:17]),
		.TXPHDLYRESET               ( reg_[2][18:18]),
		.TXPHDLYTSTCLK              (mgt_tx_if.txphdlytstclk   ),
		.TXPHINIT                   ( reg_[2][19:19]),
		.TXPHINITDONE               (wire_[6][21:21]),
		.TXPHOVRDEN                 (1'b0),
		.TXSYNCALLIN                (1'b0),
		.TXSYNCDONE                 (),
		.TXSYNCIN                   (1'b0),
		.TXSYNCMODE                 (1'b0),
		.TXSYNCOUT                  (),
		.GTHTXN                     (mgt_tx_if.gthtxn          ),
		.GTHTXP                     (mgt_tx_if.gthtxp          ),
		.TXBUFDIFFCTRL              ( reg_[2][22:20]),
		.TXDEEMPH                   ( reg_[2][23:23]),
		.TXDIFFCTRL                 ( reg_[2][27:24]),
		.TXELECIDLE                 ( reg_[2][28:28]),
		.TXINHIBIT                  ( reg_[2][29:29]),
		.TXMAINCURSOR               ( reg_[3][ 6: 0]),
		.TXMARGIN                   ( reg_[3][ 9: 7]),
		.TXPISOPD                   (1'b0),
		.TXPOSTCURSOR               ( reg_[3][14:10]),
		.TXPOSTCURSORINV            ( reg_[3][15:15]),
		.TXPRECURSOR                ( reg_[3][20:16]),
		.TXPRECURSORINV             ( reg_[3][21:21]),
		.TXQPIBIASEN                ( reg_[3][22:22]),
		.TXQPISENN                  (wire_[6][22:22]),
		.TXQPISENP                  (wire_[6][23:23]),
		.TXQPISTRONGPDOWN           ( reg_[3][23:23]),
		.TXQPIWEAKPUP               ( reg_[3][24:24]),
		.TXSWING                    ( reg_[3][25:25]),
		.TXOUTCLK                   (mgt_tx_if.txoutclk        ),
		.TXOUTCLKFABRIC             (),
		.TXOUTCLKPCS                (),
		.TXOUTCLKSEL                ( reg_[3][28:26]),
		.TXRATE                     ( reg_[3][31:29]),
		.TXRATEDONE                 (txratedone                ),
		.TXGEARBOXREADY             (mgt_tx_if.txgearboxready  ),
		.TXHEADER                   (mgt_tx_if.txheader        ),
		.TXSEQUENCE                 (mgt_tx_if.txsequence      ),
		.TXSTARTSEQ                 (mgt_tx_if.txstartseq      ),
		.TXCHARDISPMODE             (mgt_tx_if.txchardispmode  ),
		.TXCHARDISPVAL              (mgt_tx_if.txchardispval   ),
		.TXDATA                     (mgt_tx_if.txdata          ),
		.TXRATEMODE                 (1'b0),
		.TXUSRCLK                   (txusrclk                  ),
		.TXUSRCLK2                  (txusrclk2                 ),
		.TXCOMFINISH                (),
		.TXCOMINIT                  (1'b0),
		.TXCOMSAS                   (1'b0),
		.TXCOMWAKE                  (1'b0),
		.TXPIPPMEN                  ( reg_[4][ 0: 0]),
		.TXPIPPMOVRDEN              ( reg_[4][ 1: 1]),
		.TXPIPPMPD                  ( reg_[4][ 2: 2]),
		.TXPIPPMSEL                 (1'b1),
		.TXPIPPMSTEPSIZE            ( reg_[4][ 7: 3]),
		.TXPOLARITY                 ( reg_[4][ 8: 8]),
		.TXPRBSFORCEERR             ( reg_[4][ 9: 9]),
		.TXPRBSSEL                  ( reg_[4][12:10]),
		.CFGRESET                   ( reg_[4][13:13]),
		.GTTXRESET                  ( reg_[4][14:14]),
		.PCSRSVDOUT                 (),
		.TXPCSRESET                 ( reg_[4][15:15]),
		.TXPMARESET                 ( reg_[4][16:16]),
		.TXPMARESETDONE             (wire_[6][25:25]),
		.TXRESETDONE                (wire_[6][26:26]),
		.TXUSERRDY                  ( reg_[4][17:17]),
		.PHYSTATUS                  (wire_[6][27:27]),
		.RXSTATUS                   (),
		.TXDETECTRX                 ( reg_[4][18:18]),
		.CLKRSVD0                   (1'b0),
		.CLKRSVD1                   (1'b0),
		.RXRATEMODE                 (1'b0)
	);
endmodule