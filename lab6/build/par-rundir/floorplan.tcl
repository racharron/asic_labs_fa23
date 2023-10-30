# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

create_floorplan -core_margins_by die -flip f -die_size_by_io_height max -site unithd -die_size { 600 600 0 0 0 0 }
# Floorplan automatically generated from HAMMER
place_inst sram 50 50 my90
create_place_halo -insts sram -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst sram
create_place_blockage -area {0 0 100 1.08}