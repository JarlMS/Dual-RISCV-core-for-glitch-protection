################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 10/23/2023 13:29:45
#
################################################################################
if { ![is_common_ui_mode] } { error "ERROR: This script requires common_ui to be active."}

read_mmmc session/cv32e40s.mmmc.tcl

read_physical -lef {/eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_tech//lef/gsclib045_tech.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_backbias/lef/gsclib045_backbias_macro.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_hvt/lef/gsclib045_hvt_macro.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_lvt/lef/gsclib045_lvt_macro.lef}

read_netlist session/cv32e40s.v

init_design
