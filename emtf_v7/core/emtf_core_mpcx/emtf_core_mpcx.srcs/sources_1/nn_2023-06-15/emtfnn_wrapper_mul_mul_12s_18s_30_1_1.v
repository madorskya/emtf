
`timescale 1 ns / 1 ps

  module emtfnn_wrapper_mul_mul_12s_18s_30_1_1_DSP48_39(a, b, p);
input signed [12 - 1 : 0] a;
input signed [18 - 1 : 0] b;
output signed [30 - 1 : 0] p;

assign p = $signed (a) * $signed (b);

endmodule
`timescale 1 ns / 1 ps
module emtfnn_wrapper_mul_mul_12s_18s_30_1_1(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



emtfnn_wrapper_mul_mul_12s_18s_30_1_1_DSP48_39 emtfnn_wrapper_mul_mul_12s_18s_30_1_1_DSP48_39_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

