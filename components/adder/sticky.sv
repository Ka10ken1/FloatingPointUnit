// `include "./../../utils/HDecJ.sv"
// `include "./../../utils/ortree.sv"

module sticky (
    input [5:0] as2,
    input [54:0] fb2,
    output sticky
);

parameter n = 6;
wire [255:0] y;

HDecJ #(.N(n)) hdec(
    .x(as2),
    .y(y)
);

wire [54:0] or_in;
assign or_in = fb2 & y[54:0];

parameter m = 55;
ortree #(m) or_tree(
    .x(or_in),
    .or_out(sticky)
);

endmodule
