module sigrnd(
    input s,
    input db,
    input [54:0] f1,
    input [1:0] RM,

    output [53:0] f2,
    output siginx
);

wire [53:0] temp;
wire [53:0] w1;
wire l, r, st;

wire inc;

assign l = db ? f1[2] : f1[31];
assign r = db ? f1[1] : f1[30];
assign st = db ? f1[0] : f1[29];

assign siginx = r | st;

roundingdecision rdc(
    .l(l),
    .r(r),
    .st(st),
    .s(s),
    .RM(RM),
    .inc(inc)
);

assign temp = db ? (f1[54:2] + 1) : ({f1[54:31], {29{1'b1}}} + 1'b1);

// does not chop for single precision added mux
assign w1 = db ? {1'b0, f1[54:2]} : {1'b0, f1[54:30] ,  28'b0};
assign f2 = inc ? temp : w1;

endmodule

