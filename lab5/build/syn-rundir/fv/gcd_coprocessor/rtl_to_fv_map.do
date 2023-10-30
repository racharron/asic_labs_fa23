tclmode

# Generated by Genus(TM) Synthesis Solution 19.15-s090_1, revision 1.479a
# Generated on: Mon Oct 30 10:05:59 PDT 2023 (Mon Oct 30 17:05:59 UTC 2023)

set_screen_display -noprogress
set_dofile_abort exit

### Alias mapping flow is enabled. ###
# Root attribute 'wlec_rtl_name_mapping_flow' was 'false'.
# Root attribute 'alias_flow'                 was 'true'.

set lec_version [regsub {(-)[A-Za-z]} $env(LEC_VERSION) ""]

# Turns on the flowgraph datapath solver.
set wlec_analyze_dp_flowgraph true
# Indicates that resource sharing datapath optimization is present.
set share_dp_analysis         false

# The flowgraph solver is recommended for datapath analysis in LEC 19.1 or newer.
set lec_version_required "19.10100"
if {$lec_version >= $lec_version_required &&
    $wlec_analyze_dp_flowgraph} {
    set DATAPATH_SOLVER_OPTION "-flowgraph"
} elseif {$share_dp_analysis} {
    set DATAPATH_SOLVER_OPTION "-share"
} else {
    set DATAPATH_SOLVER_OPTION ""
}

tcl_set_command_name_echo on

set_log_file fv/gcd_coprocessor/rtl_to_fv_map.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/gcd_coprocessor -revised fv_map

# Root attribute 'wlec_multithread_license_list' can be used to specify a license list
# for multithreaded processing. The default list is used otherwise.
set_parallel_option -threads 1,4 -norelease_license
set_compare_options -threads 1,4

set env(RC_VERSION)     "19.15-s090_1"
set env(CDN_SYNTH_ROOT) "/home/ff/eecs151/hammer-tools/cadence/GENUS/GENUS191/tools.lnx86"
set CDN_SYNTH_ROOT      "/home/ff/eecs151/hammer-tools/cadence/GENUS/GENUS191/tools.lnx86"
set env(CW_DIR) "/home/ff/eecs151/hammer-tools/cadence/GENUS/GENUS191/tools.lnx86/lib/chipware"
set CW_DIR      "/home/ff/eecs151/hammer-tools/cadence/GENUS/GENUS191/tools.lnx86/lib/chipware"

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path . /home/ff/eecs151/hammer-tools/cadence/GENUS/GENUS191/tools.lnx86/lib/tech -library -both
read_library -liberty -both /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__gpiov2_pad_wrapped_ss_ss_100C_1v60_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vccd_lvc_clamped3_pad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vccd_lvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vdda_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vddio_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssa_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssd_lvc_clamped3_pad_ss_100C_1v60_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssd_lvc_clamped_pad_ss_100C_1v60_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssio_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_gpiov2_ss_ss_100C_1v60_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_ground_hvc_wpad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_ground_lvc_wpad_ss_100C_1v60_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_power_hvc_wpad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_power_lvc_wpad_ss_100C_1v60_3v00_3v00.lib /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_xres4v2_ss_ss_100C_1v60_3v00.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_1024x32m8w8/sram22_1024x32m8w8_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x32m4w32/sram22_64x32m4w32_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_1024x32m8w32/sram22_1024x32m8w32_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x32m4w32/sram22_512x32m4w32_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_2048x32m8w8/sram22_2048x32m8w8_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x32m4w8/sram22_512x32m4w8_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_4096x32m8w8/sram22_4096x32m8w8_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x4m4w2/sram22_64x4m4w2_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_256x32m4w8/sram22_256x32m4w8_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_4096x8m8w8/sram22_4096x8m8w8_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x32m4w8/sram22_64x32m4w8_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x24m4w24/sram22_64x24m4w24_tt_025C_1v80.rc.lib /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x64m4w8/sram22_512x64m4w8_tt_025C_1v80.rc.lib

set_undriven_signal 0 -golden
set lec_version_required "16.20100"
if {$lec_version >= $lec_version_required} {
    set_naming_style genus -golden
} else {
    set_naming_style rc -golden
}
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden
set lec_version_required "17.10200"
if {$lec_version >= $lec_version_required} {
    set_naming_rule -ungroup_separator {_} -golden
}

# Align LEC's treatment of mismatched port widths with constant
# connections with Genus's. Genus message CDFG-467 and LEC message
# HRC3.6 may indicate the presence of this issue.
# This option is only available with LEC 17.20-d301 or later.
set lec_version_required "17.20301"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -const_port_extend
}

set_hdl_options -VERILOG_INCLUDE_DIR "sep:src:cwd"
add_search_path . -design -golden
read_design -enumconstraint -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -sv09  /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab5/src/gcd_coprocessor.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab5/src/gcd_arbiter.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab5/src/gcd_unit.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab5/src/gcd_datapath.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab5/src/gcd_control.v
elaborate_design -golden -root {gcd_coprocessor} -rootonly -rootonly  

read_design -verilog95   -revised -lastmod -noelab fv/gcd_coprocessor/fv_map.v.gz
elaborate_design -revised -root {gcd_coprocessor}

uniquify -all -nolib -golden

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

set_flatten_model -balanced_modeling

# Reports the quality of the implementation information.
# This command is only available with LEC 20.10-p100 or later.
set lec_version_required "20.10100"
if {$lec_version >= $lec_version_required} {
    check_verification_information
}

set_analyze_option -auto -report_map

write_hier_compare_dofile hier_tmp1.lec.do -verbose -noexact_pin_match -constraint -usage \
-replace -balanced_extraction -input_output_pin_equivalence \
-prepend_string "report_design_data; report_unmapped_points -summary; report_unmapped_points -notmapped; analyze_datapath -module -verbose; eval analyze_datapath $DATAPATH_SOLVER_OPTION -verbose"
run_hier_compare hier_tmp1.lec.do -dynamic_hierarchy

report_hier_compare_result -dynamicflattened

report_verification -hier -verbose

write_verification_information
report_verification_information

# Reports how effective the implementation information was.
# This command is only available with LEC 18.20-d330 or later.
set lec_version_required "18.20330"
if {$lec_version >= $lec_version_required} {
    report_implementation_information
}

set_system_mode lec

puts "No of compare points = [get_compare_points -count]"
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
puts "No of abort points   = [get_compare_points -abort -count]"
puts "No of unknown points = [get_compare_points -unknown -count]"
if {[get_compare_points -count] == 0} {
    puts "---------------------------------"
    puts "ERROR: No compare points detected"
    puts "---------------------------------"
}
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}
if {[get_compare_points -abort -count] > 0} {
    puts "-----------------------------"
    puts "ERROR: Abort Points detected "
    puts "-----------------------------"
}
if {[get_compare_points -unknown -count] > 0} {
    puts "----------------------------------"
    puts "ERROR: Unknown Key Points detected"
    puts "----------------------------------"
}

# Generate a detailed summary of the run.
# This command is available with LEC 19.10-p100 or later.
set lec_version_required "19.10100"
if {$lec_version >= $lec_version_required} {
analyze_results -logfiles fv/gcd_coprocessor/rtl_to_fv_map.log
}

vpxmode

exit -f
