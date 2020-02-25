// Name:  simple_cpu
// Autor: sboldenko
// Date:  21.02.2020

module instruction_control
(
	input  clk,
	input  reset,
	//Шина памяти команд
	output im_abus_valid,	
	output [7:0] im_abus_data,
	input  jump_to_addr,
	input  [7:0] im_data
);
	
	reg [7:0] PC = 8'hFF;
	
	always @ (posedge clk or reset)
	begin
		if (reset)
			PC = 8'hFF;
		else if (jump_to_addr == 1'b1)
			PC = im_data;
		else
			PC = PC + 1'b1;
	end
	
	assign im_abus_valid = 1'b1;
	assign im_abus_data = PC;
	
endmodule