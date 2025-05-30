module andtree #(
    parameter n = 11,
    parameter npof2 = 2 ** $clog2(n)
)(
    input [n-1:0] x, 
    output and_out 
);


wire [npof2-1:0] padded_x;
assign padded_x = { {npof2 - n{1'b1}}, x };

generate
if (npof2 > 1) begin : recursive_case
wire L;
wire U;

andtree #(.n(npof2 / 2), .npof2(npof2 / 2)) lower_and (
    .x(padded_x[(npof2 / 2) - 1:0]),          
    .and_out(L)               
);

andtree #(.n(npof2 / 2), .npof2(npof2 / 2)) upper_and (
    .x(padded_x[npof2-1:(npof2 / 2)]),          
    .and_out(U)               
);

assign and_out = L & U;

end

else begin : base_case
    assign and_out = padded_x[0]; 
end

endgenerate

endmodule


