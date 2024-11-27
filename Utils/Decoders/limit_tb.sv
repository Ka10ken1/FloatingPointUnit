module limit_tb;

    // Test Parameters
    parameter N = 11;            // Size of the input signal 'as' (11 bits)
    
    // Inputs and outputs
    reg [N-1:0] as;             // 11-bit input signal 'as'
    reg eb_gt_ea;               // Control signal for inversion of 'as'
    wire [5:0] as2;             // 6-bit output signal 'as2'

    // Instantiate the limit module
    limit uut (
        .as(as),
        .eb_gt_ea(eb_gt_ea),
        .as2(as2)
    );

    // Test Vector Generation and Simulation
    integer i;

    initial begin
        // Print changes to the simulation signals
        $monitor("Time=%0t | as=%b (%d) eb_gt_ea=%b | as2=%b (%d)", 
            $time, as, as, eb_gt_ea, as2, as2);

        // Generate test vectors
        for (i = 0; i < (1 << N); i = i + 1) begin
            as = i;                   // Set the value of 'as'
            eb_gt_ea = $random % 2;   // Randomly set 'eb_gt_ea' (either 0 or 1)
            #10;                      // Wait for 10 time units to allow computation
        end
    end

    // Optional: Create a waveform dump for the simulation
    initial begin
        $dumpfile("limit_tb.vcd");    // Write VCD file
        $dumpvars(0, limit_tb);       // Dump all variables for waveform analysis
    end

endmodule