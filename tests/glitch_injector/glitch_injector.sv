//--------------------------------
// Design: glitch_injector
// File Name: glitch_injector.sv
// Function: Scramble a signal randomly or set it to a specific value 
// Coder: JarlMS
//--------------------------------

module glitch_injector #(parameter BIT_LENGTH = 1, parameter SPECIFIC = {BIT_LENGTH{1'b0}})(
    output  reg[0:BIT_LENGTH-1]     out,
    input   reg[0:BIT_LENGTH-1]     in,
    input   wire                    clk,
    input   wire                    reset,
    input   wire                    enable,
    input   wire                    enable_specific    
);
rand bit [BIT_LENGTH-1:0] random_out;

// Constraint for the random output 
constraint random_out_constraint {
    random_out inside {[{BIT_LENGTH{1'b0}}:{BIT_LENGTH{1'b1}}]}; 
}

always_ff @ (posedge clk)
    if (reset) begin 
        out <= BIT_LENGTH'b0;
    end else begin 
        if (enable_specific) begin                              // Set output of module to a specific predefined value
            out <= SPECIFIC;
        end else if (enable && !enable_specific) begin          // Set output to random value  
            randomize(random_out) with {random_out_constraint;}
            out <= random_out; 
        end else                                                // Forward input value 
            out <= in;  
    end
endmodule