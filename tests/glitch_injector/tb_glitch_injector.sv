//--------------------------------
// Design: tb_up_counter
// File Name: tb_up_counter.sv
// Function: Test bench for glitch injector 
// Coder: JarlMS
//--------------------------------

module tb_up_counter();
    reg enable;
    reg enable_specific;
    reg clk;
    reg reset;
    wire [7:0] out;
    wire [7:0] in;

    // Instantiate the DUT
    glitch_injector u0 (8,17)(
        .enable(enable),
        .enable_specific(enable_specific),
        .clk(clk),
        .reset(reset),
        .out(out),
        .in(in)
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
        enable_specific = 0;
        in = 8'b10101010;
        #10;

        // Release reset andrun 100ns with only forwaring the input though
        reset = 0;
        #100; 

        // Turn on randomization 
        enable = 1;
        #100; 

        // Turn on specific 
        enable = 0;
        enable_specific = 1;
        #100 $finish; // End the simulation
    end

    // Monitor to observe the counter's behavior
    initial begin
        $monitor("At time %0d: enable=%b, enable_specific=%b, in=%b, out=%b", $time, enable, enable_specific, in, out);
    end

endmodule
