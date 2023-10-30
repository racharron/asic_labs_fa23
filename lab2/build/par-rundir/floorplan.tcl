# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

create_floorplan -core_margins_by die -flip f -die_size_by_io_height max -site unithd -die_size { 4000 4000 10 10 10 10 }
# Floorplan automatically generated from HAMMER