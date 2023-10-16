//--------------------------------
// Design: up_counter
// File Name: up_counter.sv
// Function: Up Counter
// Coder: JarlMS
//--------------------------------

module up_counter (
    output  reg[0:7]    out,
    input   wire        enable, 
    input   wire        clk, 
    input   wire        reset    
);

always_ff @ (posedge clk)
    if (reset) begin 
        out <= 8'b0;
    end else if (enable) begin 
        out++;
    end
endmodule