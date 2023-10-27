# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.15-s090_1 on Mon Oct 23 18:46:51 PDT 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design dot_product

create_clock -name "clk" -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_load -pin_load 1.0 [get_ports a_ready]
set_load -pin_load 1.0 [get_ports b_ready]
set_load -pin_load 1.0 [get_ports {c_data[31]}]
set_load -pin_load 1.0 [get_ports {c_data[30]}]
set_load -pin_load 1.0 [get_ports {c_data[29]}]
set_load -pin_load 1.0 [get_ports {c_data[28]}]
set_load -pin_load 1.0 [get_ports {c_data[27]}]
set_load -pin_load 1.0 [get_ports {c_data[26]}]
set_load -pin_load 1.0 [get_ports {c_data[25]}]
set_load -pin_load 1.0 [get_ports {c_data[24]}]
set_load -pin_load 1.0 [get_ports {c_data[23]}]
set_load -pin_load 1.0 [get_ports {c_data[22]}]
set_load -pin_load 1.0 [get_ports {c_data[21]}]
set_load -pin_load 1.0 [get_ports {c_data[20]}]
set_load -pin_load 1.0 [get_ports {c_data[19]}]
set_load -pin_load 1.0 [get_ports {c_data[18]}]
set_load -pin_load 1.0 [get_ports {c_data[17]}]
set_load -pin_load 1.0 [get_ports {c_data[16]}]
set_load -pin_load 1.0 [get_ports {c_data[15]}]
set_load -pin_load 1.0 [get_ports {c_data[14]}]
set_load -pin_load 1.0 [get_ports {c_data[13]}]
set_load -pin_load 1.0 [get_ports {c_data[12]}]
set_load -pin_load 1.0 [get_ports {c_data[11]}]
set_load -pin_load 1.0 [get_ports {c_data[10]}]
set_load -pin_load 1.0 [get_ports {c_data[9]}]
set_load -pin_load 1.0 [get_ports {c_data[8]}]
set_load -pin_load 1.0 [get_ports {c_data[7]}]
set_load -pin_load 1.0 [get_ports {c_data[6]}]
set_load -pin_load 1.0 [get_ports {c_data[5]}]
set_load -pin_load 1.0 [get_ports {c_data[4]}]
set_load -pin_load 1.0 [get_ports {c_data[3]}]
set_load -pin_load 1.0 [get_ports {c_data[2]}]
set_load -pin_load 1.0 [get_ports {c_data[1]}]
set_load -pin_load 1.0 [get_ports {c_data[0]}]
set_load -pin_load 1.0 [get_ports c_valid]
set_clock_groups -name "clock_groups_clk_to_others" -asynchronous -group [get_clocks clk]
group_path -weight 1.000000 -name cg_enable_group_clk -through [list \
  [get_pins CLKGATE_RC_CG_HIER_INST0/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST1/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST2/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST3/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST4/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST0/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST1/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST2/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST3/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST4/enable] ]
set_clock_gating_check -setup 0.0 
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
