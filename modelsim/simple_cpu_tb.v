
`timescale 1ns/100ps

module simple_cpu_tb;

	reg clk;
	reg reset;
	
	wire im_abus_valid;
	wire [ 7:0] im_abus_data;
	reg  [15:0] mem_instr [0:255]; 
	reg  [15:0] im_dbus;
	
	wire rd_mem;
	wire wr_mem;
	
	wire [ 7:0] dm_abus;
	reg  [ 7:0] dm_in_dbus;
	wire [ 7:0] dm_out_dbus;
	reg  [ 7:0] mem_data [0:255]; 
	
	
	
	simple_cpu_top simple_cpu_top_inst
	(
		.clk(clk),
		.reset(reset),
		.im_abus_valid(im_abus_valid),
		.im_abus_data(im_abus_data),
		.im_dbus(im_dbus),
		.rd_mem(rd_mem),
		.wr_mem(wr_mem),
		.dm_abus(dm_abus),
		.dm_in_dbus(dm_in_dbus),
		.dm_out_dbus(dm_out_dbus)
	);
	
	initial 
	begin
		clk = 1'b1;
		reset = 1'b1;
		#100 reset = 1'b0;	
	end
		
	initial 
	begin
		$readmemh("instruction.dat", mem_instr);
	end	
	
	initial 
	begin
		$readmemh("data.dat", mem_data);
	end	
	
	always #5  clk = ~clk;
	always #10 im_dbus = mem_instr[im_abus_data];
	always #10 dm_in_dbus = (rd_mem == 1'b1) ? mem_data[dm_abus] : 8'hZZ;
	
	always @ (posedge clk)
		if (wr_mem)
			mem_data[dm_abus] = dm_out_dbus;
	
endmodule