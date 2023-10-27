# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.15-s090_1 on Thu Oct 26 16:31:43 PDT 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design gcd

create_clock -name "clk" -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_load -pin_load 1.0 [get_ports operands_rdy]
set_load -pin_load 1.0 [get_ports {result_bits_data[15]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[14]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[13]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[12]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[11]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[10]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[9]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[8]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[7]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[6]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[5]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[4]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[3]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[2]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[1]}]
set_load -pin_load 1.0 [get_ports {result_bits_data[0]}]
set_load -pin_load 1.0 [get_ports result_val]
set_clock_groups -name "clock_groups_clk_to_others" -asynchronous -group [get_clocks clk]
group_path -weight 1.000000 -name cg_enable_group_clk -through [list \
  [get_pins GCDdpath0/A_register/CLKGATE_RC_CG_HIER_INST0/enable]  \
  [get_pins GCDdpath0/B_register/CLKGATE_RC_CG_HIER_INST1/enable]  \
  [get_pins GCDdpath0/A_register/CLKGATE_RC_CG_HIER_INST0/enable]  \
  [get_pins GCDdpath0/B_register/CLKGATE_RC_CG_HIER_INST1/enable] ]
set_clock_gating_check -setup 0.0 
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
