add wave -noupdate -divider testbench
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {testbench} /simple_cpu_tb/*

add wave -noupdate -divider top
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {top} /simple_cpu_tb/simple_cpu_top_inst/*

add wave -noupdate -divider operation_module
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {operation_module} /simple_cpu_tb/simple_cpu_top_inst/operation_module_inst/*

add wave -noupdate -divider instruction_control
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {instruction_control} /simple_cpu_tb/simple_cpu_top_inst/operation_module_inst/instruction_control_inst/*

add wave -noupdate -divider data_memory_control
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {data_memory_control} /simple_cpu_tb/simple_cpu_top_inst/operation_module_inst/data_memory_control_inst/*

add wave -noupdate -divider alu
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {alu} /simple_cpu_tb/simple_cpu_top_inst/operation_module_inst/alu_inst/*

add wave -noupdate -divider controller
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {controller} /simple_cpu_tb/simple_cpu_top_inst/controller_inst/*

configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps