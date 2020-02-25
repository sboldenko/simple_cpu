// Name:  simple_cpu
// Autor: sboldenko
// Date:  20.02.2020
 
module simple_cpu_top
(
	input  clk,
	input  reset,
	//Шина памяти команд
	output im_abus_valid,	
	output [ 7:0] im_abus_data,
	input  [15:0] im_dbus,
	//Шина памяти данных
	output rd_mem,
	output wr_mem,
	output [7:0] dm_abus,
	input  [7:0] dm_in_dbus,
	output [7:0] dm_out_dbus
);
	
	wire [7:0] im_data;
	wire [7:0] opcode;
	wire jump_to_addr;
	wire [3:0] alu_control;
	wire rd_dmem;
	wire wr_dmem;
	
	assign im_data = im_dbus[7:0];
	assign opcode = im_dbus[15:8];	
	
	assign rd_mem = rd_dmem;
	assign wr_mem = wr_dmem;
	
	operation_module operation_module_inst
	(
		.clk(clk),
		.reset(reset),
		.im_abus_valid(im_abus_valid),
		.im_abus_data(im_abus_data),
		.im_data(im_data),
		.jump_to_addr(jump_to_addr),
		.alu_control(alu_control),
		.rd_dmem(rd_dmem),
		.wr_dmem(wr_dmem),
		.dm_abus(dm_abus),
		.dm_in_dbus(dm_in_dbus),
		.dm_out_dbus(dm_out_dbus)
	);
	
	controller controller_inst
	(
		.clk(clk),
		.opcode(opcode),
		.jump_to_addr(jump_to_addr),
		.alu_control(alu_control),
		.rd_dmem(rd_dmem),
		.wr_dmem(wr_dmem)
	);
	
endmodule