# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.15-s090_1 on Sun Oct 29 23:26:47 PDT 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design gcd

create_clock -name "clk" -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_load -pin_load 1.0 [get_ports done]
set_load -pin_load 1.0 [get_ports {quotient[3]}]
set_load -pin_load 1.0 [get_ports {quotient[2]}]
set_load -pin_load 1.0 [get_ports {quotient[1]}]
set_load -pin_load 1.0 [get_ports {quotient[0]}]
set_load -pin_load 1.0 [get_ports {remainder[3]}]
set_load -pin_load 1.0 [get_ports {remainder[2]}]
set_load -pin_load 1.0 [get_ports {remainder[1]}]
set_load -pin_load 1.0 [get_ports {remainder[0]}]
set_clock_groups -name "clock_groups_clk_to_others" -asynchronous -group [get_clocks clk]
group_path -weight 1.000000 -name cg_enable_group_clk -through [list \
  [get_pins CLKGATE_RC_CG_HIER_INST0/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST3/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST0/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST3/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST0/enable]  \
  [get_pins CLKGATE_RC_CG_HIER_INST3/enable]  \
  [get_pins CLKGATE_RC_CG_DECLONE_HIER_INST/enable] ]
set_clock_gating_check -setup 0.0 
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
