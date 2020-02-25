vlib work
vmap work work

vlog ../hdl/verilog/simple_cpu.v
vlog ../hdl/verilog/operation_module.v
vlog ../hdl/verilog/alu.v
vlog ../hdl/verilog/instruction_control.v
vlog ../hdl/verilog/controller.v
vlog ../hdl/verilog/data_memory_control.v

vlog simple_cpu_tb.v

vsim -t 1ps -novopt -lib work  -L work simple_cpu_tb

do wave_test.do 
view wave
run 1 us