`include "./../sticky.sv"
module tb_sticky;

    reg [5:0] as2;
    reg [54:0] fb2;
    wire sticky;

    sticky uut (
        .as2(as2),
        .fb2(fb2),
        .sticky(sticky)
    );

    initial begin
        as2 = 6'b101010;
        fb2 = 55'b1101110101101110101101110101101110110110101101110101101;
        #10;
        
        as2 = 6'b000000;
        fb2 = 55'b0101010101010101010101010101010101010101010101010101010;
        #10;
        
        as2 = 6'b111111;
        fb2 = 55'b0011001100110011001100110011001100110011001100110011001;
        #10;
        
        as2 = 6'b101110;
        fb2 = 55'b0101010101010101010101010101010101010101010101010101010;
        #10;
        
        as2 = 6'b000110;
        fb2 = 55'b1111111111111111111111111111111111111111111111111111111;
        #10;
        
        $stop;
    end
endmodule

