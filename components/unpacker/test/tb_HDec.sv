// `include "./../HDec.sv"
module tb_HDec;

    parameter N = 3;  
    reg [N-1:0] x;  
    wire [2**N-1:0] y;

    HDec #(N) dut (
        .x(x),
        .y(y)
    );

    initial begin
        int i;
        for (i = 0; i < 2**N; i = i + 1) begin
            x = i;  
            #50;   
        end

    end

endmodule
