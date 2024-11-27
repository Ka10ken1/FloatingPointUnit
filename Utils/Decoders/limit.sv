module limit(
    input wire[10: 0] as,
    input wire eb_gt_ea,
    output reg[5:0] as2
);
reg[10:0] as1;
reg or1;
ortree#(.N(5)) or_tr (
 .ea(as1[10:6]),
 .orres(or1)
);
always@(*) begin
as1 = eb_gt_ea ? ~as : as;
as2 = as1[5:0] | or1;

end    


endmodule
