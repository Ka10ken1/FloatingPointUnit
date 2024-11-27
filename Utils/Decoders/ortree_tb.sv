module ortree_tb;

    // Test Parameters
    parameter N = 7;  // Size of the input array (7 bits)

    reg [N-1:0] ea;  // Input signal for the OR tree
    wire orres;          // Output of the OR tree

    // Instantiate the OR Tree module
    ortree #(N) uut (
        .ea(ea),
        .orres(orres)
    );

    integer i;

    // Testbench
    initial begin
        // Display the signal changes during simulation
        $monitor("Time=%0t | ea=%b (%d) | orres=%b", $time, ea, ea, orres);

        // Generate test vectors for ea (from 0 to 127, as N=7)
        for (i = 0; i < (1 << N); i = i + 1) begin
            ea = i;         // Assign test vector to ea
            #10;            // Wait for 10 time units
        end
    end

    // Optional: Create a waveform dump for the simulation
    initial begin
        $dumpfile("ortree_tb.vcd");  // Write VCD file
        $dumpvars(0, ortree_tb);     // Dump all variables to the VCD file
    end

endmodule