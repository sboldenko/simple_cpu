// Name:  simple_cpu
// Autor: sboldenko
// Date:  20.02.2020
 
module alu
(
	input  clk,
	input  [ 3:0] control, 
	input  [ 7:0] A,
	input  [ 7:0] B,
	output [15:0] Y
);

	reg [15:0] result = 16'h0000;	
	
	always @ (posedge clk)
	begin
		case (control)
			4'b0001: result = {8'h00, A + B};
			4'b0010: result = {8'h00, A - B};
			4'b0100: result = A * B;
			4'b1000: result = A / B;
		endcase
	end
	
	assign Y = result;
	
endmodule