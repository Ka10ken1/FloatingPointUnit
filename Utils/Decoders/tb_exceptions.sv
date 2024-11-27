module exceptions_tb;
    reg einf, h, fz, ez;
    wire ZERO, INF, NAN, SNAN;
    integer i;
    exceptions uut (
        .einf(einf),
        .h(h),
        .fz(fz),
        .ez(ez),
        .ZERO(ZERO),
        .INF(INF),
        .NAN(NAN),
        .SNAN(SNAN)
    );

    initial begin
        $monitor("Time=%0t einf=%b h=%b fz=%b ez=%b | ZERO=%b INF=%b NAN=%b SNAN=%b", 
            $time, einf, h, fz, ez, ZERO, INF, NAN, SNAN);
        for (i = 0; i < 16; i = i + 1) begin
            {einf, h, fz, ez} = i; 
            #10;                  
        end
    end
endmodule