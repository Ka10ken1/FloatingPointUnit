module expsub(
    input wire[10: 0] ea,
    input wire[10: 0] eb,
    output reg[10:0] as,
    output reg eb_gt_ea
);

reg[11:0] ea1;
reg[11:0] eb1;
reg[11:0] astemp;
always @(*) begin
ea1 = {ea[10], {ea[10], ea[9:0]}};
eb1 = {eb[10], {~eb[10], ~eb[9:0]}};    
astemp = ea1 + eb1 + 1;
eb_gt_ea = astemp[11];
as = astemp[10:0];
end

endmodule
