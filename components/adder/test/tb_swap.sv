`include "./../swap.sv"
module tb_swap;

    reg sa;
    reg [52:0] fa;
    reg sb;
    reg [52:0] fb;
    reg eb_gt_ea;

    wire sa2;
    wire [52:0] fa2;
    wire sb2;
    wire [54:0] fb2;

    swap uut (
        .sa(sa),
        .fa(fa),
        .sb(sb),
        .fb(fb),
        .eb_gt_ea(eb_gt_ea),
        .sa2(sa2),
        .fa2(fa2),
        .sb2(sb2),
        .fb2(fb2)
    );

    initial begin
        $display("Time | sa  | fa             | sb  | fb             | eb_gt_ea | sa2 | fa2            | sb2 | fb2");
        $monitor("%4t | %b   | %b | %b   | %b | %b       | %b   | %b             | %b   | %b", 
                 $time, sa, fa, sb, fb, eb_gt_ea, sa2, fa2, sb2, fb2);

        sa = 1; fa = 53'b1010101010101010101010101010101010101010101010101; sb = 0; fb = 53'b1100110011001100110011001100110011001100110011001; eb_gt_ea = 0; #10;
        sa = 0; fa = 53'b1111000011110000111100001111000011110000111100000; sb = 1; fb = 53'b0011001100110011001100110011001100110011001100110; eb_gt_ea = 1; #10;
        sa = 1; fa = 53'b0000111100001111000011110000111100001111000011110; sb = 0; fb = 53'b1010101010101010101010101010101010101010101010101; eb_gt_ea = 0; #10;
        sa = 0; fa = 53'b1111110000001111110000001111110000001111110000001; sb = 1; fb = 53'b1001100110011001100110011001100110011001100110011; eb_gt_ea = 1; #10;
        sa = 1; fa = 53'b0101010101010101010101010101010101010101010101010; sb = 0; fb = 53'b0000000000000000000000000000000000000000000000000; eb_gt_ea = 0; #10;
        sa = 0; fa = 53'b0000000000000000000000000000000000000000000000000; sb = 1; fb = 53'b1111111111111111111111111111111111111111111111111; eb_gt_ea = 1; #10;

        $stop;
    end

endmodule

