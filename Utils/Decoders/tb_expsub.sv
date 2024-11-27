module tb_expsub;
    reg [10:0] ea, eb;          
    wire [10:0] as;            
    wire eb_gt_ea;            

    expsub uut (
        .ea(ea),
        .eb(eb),
        .as(as),
        .eb_gt_ea(eb_gt_ea)
    );

    integer i, j; 

    // Two's complement of the number (bitwise negation + 1)
    reg [10:0] ea_twos_complement, eb_twos_complement;

    initial begin
        $monitor("Time=%0t | ea=%b (%d) ea_twos_complement=%b (%d) | eb=%b (%d) eb_twos_complement=%b (%d) | as=%b (%d) (as in twos complement=%d) eb_gt_ea=%b", 
            $time, ea, ea, ea_twos_complement, ea_twos_complement, eb, eb, eb_twos_complement, eb_twos_complement, as, as, $signed(as), eb_gt_ea);

        // Test all combinations of ea and eb in the range 0 to 15 (since 16x16)
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                ea = i; 
                eb = j;
                ea_twos_complement = ~ea + 1;
                eb_twos_complement = ~eb + 1;

                #10; 
            end
        end
    end
endmodule