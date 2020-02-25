// Name:  simple_cpu
// Autor: sboldenko
// Date:  21.02.2020

module data_memory_control
(
	input  clk,
	input  rd_dmem, 	
	input  wr_dmem,
	input  [7:0] im_data,
	output [7:0] dm_abus
);
	
	assign dm_abus = 	(rd_dmem == 1'b1) ? im_data:
						(wr_dmem == 1'b1) ? im_data: 8'h00;
	
endmodule