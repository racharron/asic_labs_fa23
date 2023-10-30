# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.15-s090_1 on Sun Oct 29 17:17:56 PDT 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design fir

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk]
set_load -pin_load 1.0 [get_ports {Out[15]}]
set_load -pin_load 1.0 [get_ports {Out[14]}]
set_load -pin_load 1.0 [get_ports {Out[13]}]
set_load -pin_load 1.0 [get_ports {Out[12]}]
set_load -pin_load 1.0 [get_ports {Out[11]}]
set_load -pin_load 1.0 [get_ports {Out[10]}]
set_load -pin_load 1.0 [get_ports {Out[9]}]
set_load -pin_load 1.0 [get_ports {Out[8]}]
set_load -pin_load 1.0 [get_ports {Out[7]}]
set_load -pin_load 1.0 [get_ports {Out[6]}]
set_load -pin_load 1.0 [get_ports {Out[5]}]
set_load -pin_load 1.0 [get_ports {Out[4]}]
set_load -pin_load 1.0 [get_ports {Out[3]}]
set_load -pin_load 1.0 [get_ports {Out[2]}]
set_load -pin_load 1.0 [get_ports {Out[1]}]
set_load -pin_load 1.0 [get_ports {Out[0]}]
set_clock_groups -name "clock_groups_clk_to_others" -asynchronous -group [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__probe_p_8]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__probec_p_8]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfbbn_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfbbn_2]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfbbp_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfrbp_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfrbp_2]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfrtn_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfrtp_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfrtp_2]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfrtp_4]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfsbp_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfsbp_2]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfstp_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfstp_2]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfstp_4]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfxbp_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfxbp_2]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfxtp_1]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfxtp_2]
set_dont_use true [get_lib_cells sky130_fd_sc_hd__ss_100C_1v60/sky130_fd_sc_hd__sdfxtp_4]
set_clock_uncertainty -setup 1.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
