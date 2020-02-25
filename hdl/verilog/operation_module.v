module operation_module
(
	input  clk,
	input  reset,
	//Шина памяти команд
	output im_abus_valid,	
	output [7:0] im_abus_data,
	input  [7:0] im_data,
	//Флаги контроля 
	input  jump_to_addr,
	input  [3:0] alu_control,
	input  rd_dmem, 
	input  wr_dmem, 
	//Шина памяти данных
	output [7:0] dm_abus,
	input  [7:0] dm_in_dbus,
	output [7:0] dm_out_dbus
);
	
	reg  rd_dmem_d;
	reg  rd_dmem_dd;
	reg  [15:0] AC = 16'h0000;
	wire [15:0] Y;
	
	always @ (posedge clk)
	begin
		rd_dmem_d <= rd_dmem;
		rd_dmem_dd = rd_dmem_d;
		
		if (rd_dmem_dd)
			AC [7:0] = dm_in_dbus;
		else
			AC = Y;
	end
	

	assign dm_out_dbus = wr_dmem ? AC [7:0]: 8'h00;
	
	alu alu_inst
	(
		.clk(clk),
		.control(alu_control),
		.A(AC [7:0]),
		.B(im_data),
		.Y(Y)
	);
	
	instruction_control instruction_control_inst
	(
		.clk(clk),
		.reset(reset),
		.im_abus_valid(im_abus_valid),
		.im_abus_data(im_abus_data),
		.jump_to_addr(jump_to_addr),
		.im_data
	);
	
	data_memory_control data_memory_control_inst
	(
		.clk(clk),
		.rd_dmem(rd_dmem),
		.wr_dmem(wr_dmem),
		.im_data(im_data),
		.dm_abus(dm_abus)
	);
	
endmodule