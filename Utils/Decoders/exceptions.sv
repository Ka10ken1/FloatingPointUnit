module exceptions(
    input einf,
    input h,
    input fz, 
    input ez,
    output reg ZERO,
    output reg INF,
    output reg NAN,
    output reg SNAN
);

always @(*) begin
ZERO = ez & fz;
INF = einf & fz;
NAN = einf & h;
SNAN = einf & ~(h | fz); 
end

endmodule
