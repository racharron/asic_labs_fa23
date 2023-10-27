# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

puts "set_db hdl_error_on_blackbox true" 
set_db hdl_error_on_blackbox true
puts "set_db max_cpus_per_server 4" 
set_db max_cpus_per_server 4
puts "set_db lp_clock_gating_infer_enable  true" 
set_db lp_clock_gating_infer_enable  true
puts "set_db lp_clock_gating_prefix  {CLKGATE}" 
set_db lp_clock_gating_prefix  {CLKGATE}
puts "set_db lp_insert_clock_gating  true" 
set_db lp_insert_clock_gating  true
puts "set_db lp_insert_clock_gating_incremental true" 
set_db lp_insert_clock_gating_incremental true
puts "set_db lp_clock_gating_register_aware true" 
set_db lp_clock_gating_register_aware true
puts "read_mmmc /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/syn-rundir/mmmc.tcl" 
read_mmmc /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/syn-rundir/mmmc.tcl
puts "read_physical -lef { /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/tech-sky130-cache/sky130_ef_io.lef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lef/sky130_fd_io.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_1024x32m8w8/sram22_1024x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x32m4w32/sram22_64x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_1024x32m8w32/sram22_1024x32m8w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x32m4w32/sram22_512x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_2048x32m8w8/sram22_2048x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x32m4w8/sram22_512x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_4096x32m8w8/sram22_4096x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x4m4w2/sram22_64x4m4w2.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_256x32m4w8/sram22_256x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_4096x8m8w8/sram22_4096x8m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x32m4w8/sram22_64x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x24m4w24/sram22_64x24m4w24.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x64m4w8/sram22_512x64m4w8.lef }" 
read_physical -lef { /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/build/tech-sky130-cache/sky130_ef_io.lef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lef/sky130_fd_io.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_1024x32m8w8/sram22_1024x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x32m4w32/sram22_64x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_1024x32m8w32/sram22_1024x32m8w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x32m4w32/sram22_512x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_2048x32m8w8/sram22_2048x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x32m4w8/sram22_512x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_4096x32m8w8/sram22_4096x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x4m4w2/sram22_64x4m4w2.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_256x32m4w8/sram22_256x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_4096x8m8w8/sram22_4096x8m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x32m4w8/sram22_64x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_64x24m4w24/sram22_64x24m4w24.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros/sram22_512x64m4w8/sram22_512x64m4w8.lef }
puts "read_hdl -sv { /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/gcd.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/gcd_datapath.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/gcd_control.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/EECS151.v }" 
read_hdl -sv { /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/gcd.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/gcd_datapath.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/gcd_control.v /home/cc/eecs151/fa23/class/eecs151-aeq/asic_labs_fa23/lab3/src/EECS151.v }
puts "elaborate gcd" 
elaborate gcd
puts "init_design -top gcd" 
init_design -top gcd
puts "set_db root: .auto_ungroup none" 
set_db root: .auto_ungroup none
puts "set_units -capacitance 1.0pF" 
set_units -capacitance 1.0pF
puts "set_load_unit -picofarads 1" 
set_load_unit -picofarads 1
puts "set_units -time 1.0ns" 
set_units -time 1.0ns

puts "set_dont_use \[get_db lib_cells */*sdf*\]"
if { [get_db lib_cells */*sdf*] ne "" } {
    set_dont_use [get_db lib_cells */*sdf*]
} else {
    puts "WARNING: cell */*sdf* was not found for set_dont_use"
}
            

puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probe_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probe_p_*] ne "" } {
    set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probe_p_*]
} else {
    puts "WARNING: cell */sky130_fd_sc_hd__probe_p_* was not found for set_dont_use"
}
            

puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probec_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probec_p_*] ne "" } {
    set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probec_p_*]
} else {
    puts "WARNING: cell */sky130_fd_sc_hd__probec_p_* was not found for set_dont_use"
}
            
puts "quit" 
quit