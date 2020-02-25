// Name:  simple_cpu
// Autor: sboldenko
// Date:  21.02.2020

module controller
(
	input  clk,
	input  [7:0] opcode,
	output jump_to_addr,
	output [3:0] alu_control,
	output rd_dmem, 	
	output wr_dmem 	
);
	
	assign jump_to_addr = (opcode == 8'h02) ? 1'b1 : 1'b0;
	assign alu_control = 	(opcode == 8'h03) ? (4'b0001) :
							(opcode == 8'h04) ? (4'b0010) :
							(opcode == 8'h05) ? (4'b0100) :
							(opcode == 8'h06) ? (4'b1000) : 4'b0000;
	assign rd_dmem = (opcode == 8'h00) ? 1'b1 : 1'b0;
	assign wr_dmem = (opcode == 8'h01) ? 1'b1 : 1'b0;
	
endmodule