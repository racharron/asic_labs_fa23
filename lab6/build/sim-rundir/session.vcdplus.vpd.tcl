# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Mon Oct 23 19:11:16 2023
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 14 signals
# End_DVE_Session_Save_Info

# DVE version: P-2019.06_Full64
# DVE build date: May 31 2019 21:08:21


#<Session mode="View" path="/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab6/build/sim-rundir/session.vcdplus.vpd.tcl" type="Debug">

#<Database>

gui_set_time_units 1ns
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Mon Oct 23 19:11:16 2023
# 14 signals
# End_DVE_Session_Save_Info

# DVE version: P-2019.06_Full64
# DVE build date: May 31 2019 21:08:21


#Add ncecessay scopes
gui_load_child_values {dot_product_tb.dut}
gui_load_child_values {dot_product_tb}

gui_set_time_units 1ns

set _wave_session_group_1 Group1
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {V1:dot_product_tb.clk} {V1:dot_product_tb.dut.rst} {V1:dot_product_tb.dut.addr} {V1:dot_product_tb.dut.din} {V1:dot_product_tb.dut.dout} {V1:dot_product_tb.dut.b_cache} {V1:dot_product_tb.dut.c_valid} {V1:dot_product_tb.dut.c_data} {V1:dot_product_tb.dut.a_len} {V1:dot_product_tb.dut.b_len} {V1:dot_product_tb.dut.processing} {V1:dot_product_tb.dut.b_stored} {V1:dot_product_tb.dut.initializing} {V1:dot_product_tb.dut.we} }
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 852.704 974.065
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_select -id ${Wave.1} {dot_product_tb.dut.we }
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group1}  -item {dot_product_tb.dut.c_data[31:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 927.5
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

