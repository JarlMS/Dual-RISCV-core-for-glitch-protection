//--------------------------------
// Design: glitch_injector
// File Name: glitch_injector.sv
// Function: Scramble a signal randomly or set it to a specific value 
// Coder: JarlMS
//--------------------------------

module glitch_injector #(parameter BIT_LENGTH = 1, parameter SPECIFIC = {BIT_LENGTH{1'b0}})(
    output  logic [0:BIT_LENGTH-1]     out,
    input   logic [0:BIT_LENGTH-1]     in,
    input   wire                    clk,
    input   wire                    reset,
    input   wire                    enable,
    input   wire                    enable_specific    
);

always_ff @ (posedge clk or posedge reset) begin 
    if (reset) begin 
        out <= 0;
    end else begin
        reg [BIT_LENGTH-1:0] random_out; // Declare 'random_out' as a register

        if (enable_specific) begin
            out <= SPECIFIC;
        end else if (enable && !enable_specific) begin
            //randomize(random_out);
            random_out = $urandom;
            out <= random_out; 
        end else
            out <= in;  
    end
end
endmodule
