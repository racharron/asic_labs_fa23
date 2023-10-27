# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.15-s090_1 on Thu Oct 26 19:43:28 PDT 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design gcd_coprocessor

create_clock -name "clk" -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_load -pin_load 1.0 [get_ports operands_rdy]
set_load -pin_load 1.0 [get_ports result_val]
set_load -pin_load 1.0 [get_ports {result_bits[31]}]
set_load -pin_load 1.0 [get_ports {result_bits[30]}]
set_load -pin_load 1.0 [get_ports {result_bits[29]}]
set_load -pin_load 1.0 [get_ports {result_bits[28]}]
set_load -pin_load 1.0 [get_ports {result_bits[27]}]
set_load -pin_load 1.0 [get_ports {result_bits[26]}]
set_load -pin_load 1.0 [get_ports {result_bits[25]}]
set_load -pin_load 1.0 [get_ports {result_bits[24]}]
set_load -pin_load 1.0 [get_ports {result_bits[23]}]
set_load -pin_load 1.0 [get_ports {result_bits[22]}]
set_load -pin_load 1.0 [get_ports {result_bits[21]}]
set_load -pin_load 1.0 [get_ports {result_bits[20]}]
set_load -pin_load 1.0 [get_ports {result_bits[19]}]
set_load -pin_load 1.0 [get_ports {result_bits[18]}]
set_load -pin_load 1.0 [get_ports {result_bits[17]}]
set_load -pin_load 1.0 [get_ports {result_bits[16]}]
set_load -pin_load 1.0 [get_ports {result_bits[15]}]
set_load -pin_load 1.0 [get_ports {result_bits[14]}]
set_load -pin_load 1.0 [get_ports {result_bits[13]}]
set_load -pin_load 1.0 [get_ports {result_bits[12]}]
set_load -pin_load 1.0 [get_ports {result_bits[11]}]
set_load -pin_load 1.0 [get_ports {result_bits[10]}]
set_load -pin_load 1.0 [get_ports {result_bits[9]}]
set_load -pin_load 1.0 [get_ports {result_bits[8]}]
set_load -pin_load 1.0 [get_ports {result_bits[7]}]
set_load -pin_load 1.0 [get_ports {result_bits[6]}]
set_load -pin_load 1.0 [get_ports {result_bits[5]}]
set_load -pin_load 1.0 [get_ports {result_bits[4]}]
set_load -pin_load 1.0 [get_ports {result_bits[3]}]
set_load -pin_load 1.0 [get_ports {result_bits[2]}]
set_load -pin_load 1.0 [get_ports {result_bits[1]}]
set_load -pin_load 1.0 [get_ports {result_bits[0]}]
set_clock_groups -name "clock_groups_clk_to_others" -asynchronous -group [get_clocks clk]
group_path -weight 1.000000 -name cg_enable_group_clk -through [list \
  [get_pins {units[0]/dpath/CLKGATE_RC_CG_HIER_INST0/enable}]  \
  [get_pins {units[0]/dpath/CLKGATE_RC_CG_HIER_INST1/enable}]  \
  [get_pins {units[1]/dpath/CLKGATE_RC_CG_HIER_INST2/enable}]  \
  [get_pins {units[1]/dpath/CLKGATE_RC_CG_HIER_INST3/enable}]  \
  [get_pins {units[2]/dpath/CLKGATE_RC_CG_HIER_INST4/enable}]  \
  [get_pins {units[2]/dpath/CLKGATE_RC_CG_HIER_INST5/enable}]  \
  [get_pins {units[3]/dpath/CLKGATE_RC_CG_HIER_INST6/enable}]  \
  [get_pins {units[3]/dpath/CLKGATE_RC_CG_HIER_INST7/enable}]  \
  [get_pins {units[0]/dpath/CLKGATE_RC_CG_HIER_INST0/enable}]  \
  [get_pins {units[0]/dpath/CLKGATE_RC_CG_HIER_INST1/enable}]  \
  [get_pins {units[1]/dpath/CLKGATE_RC_CG_HIER_INST2/enable}]  \
  [get_pins {units[1]/dpath/CLKGATE_RC_CG_HIER_INST3/enable}]  \
  [get_pins {units[2]/dpath/CLKGATE_RC_CG_HIER_INST4/enable}]  \
  [get_pins {units[2]/dpath/CLKGATE_RC_CG_HIER_INST5/enable}]  \
  [get_pins {units[3]/dpath/CLKGATE_RC_CG_HIER_INST6/enable}]  \
  [get_pins {units[3]/dpath/CLKGATE_RC_CG_HIER_INST7/enable}] ]
set_clock_gating_check -setup 0.0 
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
