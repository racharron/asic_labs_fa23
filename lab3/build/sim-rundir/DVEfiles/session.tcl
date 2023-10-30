# Begin_DVE_Session_Save_Info
# DVE reload session
# Saved on Sun Oct 29 22:25:20 2023
# Designs open: 1
#   V1: /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/sim-rundir/vcdplus.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: divider_testbench
#   Wave.1: 14 signals
#   Group count = 3
#   Group Group1 signal count = 3
#   Group Group2 signal count = 4
#   Group Group3 signal count = 7
# End_DVE_Session_Save_Info

# DVE version: P-2019.06_Full64
# DVE build date: May 31 2019 21:08:21


#<Session mode="Reload" path="/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/sim-rundir/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Reload
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all
gui_clear_window -type Wave
gui_clear_window -type List

# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

set TopLevel.1 TopLevel.1

# Docked window settings
set HSPane.1 HSPane.1
set Hier.1 Hier.1
set DLPane.1 DLPane.1
set Data.1 Data.1
set Console.1 Console.1
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 Source.1
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

set TopLevel.2 TopLevel.2

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 Wave.1
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 553} {child_wave_right 1349} {child_wave_colname 274} {child_wave_colvalue 275} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/sim-rundir/vcdplus.vpd}] } {
	gui_open_db -design V1 -file /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/sim-rundir/vcdplus.vpd -nosource
}
gui_set_precision 100ps
gui_set_time_units 1ns
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {divider_testbench.divider}


set _session_group_10 Group1
gui_sg_create "$_session_group_10"
set Group1 "$_session_group_10"

gui_sg_addsignal -group "$_session_group_10" { divider_testbench.divider.clk divider_testbench.divider.start divider_testbench.divider.done }

set _session_group_11 Group2
gui_sg_create "$_session_group_11"
set Group2 "$_session_group_11"

gui_sg_addsignal -group "$_session_group_11" { divider_testbench.divider.dividend divider_testbench.divider.divisor divider_testbench.divider.quotient divider_testbench.divider.remainder }
gui_set_radix -radix {decimal} -signals {V1:divider_testbench.divider.dividend}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.dividend}
gui_set_radix -radix {decimal} -signals {V1:divider_testbench.divider.divisor}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.divisor}
gui_set_radix -radix {decimal} -signals {V1:divider_testbench.divider.quotient}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.quotient}
gui_set_radix -radix {decimal} -signals {V1:divider_testbench.divider.remainder}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.remainder}

set _session_group_12 Group3
gui_sg_create "$_session_group_12"
set Group3 "$_session_group_12"

gui_sg_addsignal -group "$_session_group_12" { divider_testbench.divider.long_remainder divider_testbench.divider.shifted_remainder divider_testbench.divider.left_half divider_testbench.divider.right_half divider_testbench.divider.subtracted divider_testbench.divider.sub_negative divider_testbench.divider.iteration }
gui_set_radix -radix {binary} -signals {V1:divider_testbench.divider.long_remainder}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.long_remainder}
gui_set_radix -radix {binary} -signals {V1:divider_testbench.divider.shifted_remainder}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.shifted_remainder}
gui_set_radix -radix {binary} -signals {V1:divider_testbench.divider.left_half}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.left_half}
gui_set_radix -radix {binary} -signals {V1:divider_testbench.divider.right_half}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.right_half}
gui_set_radix -radix {binary} -signals {V1:divider_testbench.divider.subtracted}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.subtracted}
gui_set_radix -radix {decimal} -signals {V1:divider_testbench.divider.iteration}
gui_set_radix -radix {unsigned} -signals {V1:divider_testbench.divider.iteration}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 12765.4



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*} -force
gui_change_design -id ${Hier.1} -design V1
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active divider_testbench /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/divider_testbench.v
gui_view_scroll -id ${Source.1} -vertical -set 210
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_wv_zoom_timerange -id ${Wave.1} 12842.2 12995.3
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group2}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group3}
gui_list_select -id ${Wave.1} {divider_testbench.divider.sub_negative }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Group3  -item {divider_testbench.divider.iteration[2:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 12765.4
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

