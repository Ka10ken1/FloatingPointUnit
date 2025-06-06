module lrs (
    input [5:0] as2,
    input [54:0] fb2,
    output [54:0] fb3
);

assign fb3 = (as2 >= 55) ? 55'b0 : (fb2 >> as2);
endmodule
