//--------------------------------
// Design: tb_up_counter
// File Name: tb_up_counter.sv
// Function: Test bench for up counter
// Coder: JarlMS
//--------------------------------

module tb_up_counter();
    reg enable;
    reg clk;
    reg reset;
    wire [7:0] out;

    // Instantiate the DUT
    up_counter u0 (
        .enable(enable),
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initial conditions
        clk = 0;
        reset = 1;
        enable = 0;
        #10;

        // Release reset and start counter
        reset = 0;
        #10 enable = 1;
        #80 enable = 0;  // Disable counting after 8 cycles

        #20 $finish;  // End the simulation
    end

    // Monitor to observe the counter's behavior
    initial begin
        $monitor("At time %0d: enable=%b, out=%b", $time, enable, out);
    end

endmodule
