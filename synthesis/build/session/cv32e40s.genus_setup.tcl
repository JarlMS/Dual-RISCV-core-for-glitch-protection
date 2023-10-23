################################################################################
#
# Genus(TM) Synthesis Solution setup file
# Created by Genus(TM) Synthesis Solution 21.18-s082_1
#   on 10/23/2023 13:29:46
#
# This file can only be run in Genus Common UI mode.
#
################################################################################


# This script is intended for use with Genus(TM) Synthesis Solution version 21.18-s082_1


# Remove Existing Design
################################################################################
if {[::legacy::find -design design:cv32e40s_core] ne ""} {
  puts "** A design with the same name is already loaded. It will be removed. **"
  delete_obj design:cv32e40s_core
}


# To allow user-readonly attributes
################################################################################
::legacy::set_attribute -quiet force_tui_is_remote 1 /


# Libraries
################################################################################
::legacy::set_attribute library {/eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_basicCells.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_multibitsDFF.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_extvdd1v0.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_extvdd1v2.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v2_basicCells.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v2_multibitsDFF.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v2_extvdd1v0.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v2_extvdd1v2.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v0_multibitsDFF.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v0_extvdd1v0.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v0_extvdd1v2.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v2_basicCells.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v2_multibitsDFF.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v2_extvdd1v0.lib /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v2_extvdd1v2.lib} /

::legacy::set_attribute lef_library {/eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_tech//lef/gsclib045_tech.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_backbias/lef/gsclib045_backbias_macro.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_hvt/lef/gsclib045_hvt_macro.lef /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_lvt/lef/gsclib045_lvt_macro.lef} /
::legacy::set_attribute qrc_tech_file /eda/kits/cadence/45nm/gsclib045_all_v4.4/gsclib045_tech//qrc/qx/gpdk045.tch /


# Design
################################################################################
read_netlist -top cv32e40s_core session/cv32e40s.v
read_metric -id current session/cv32e40s.metrics.json

phys::read_script session/cv32e40s.g
puts "\n** Restoration Completed **\n"


# Data Integrity Check
################################################################################
# program version
if {"[string_representation [::legacy::get_attribute program_version /]]" != "21.18-s082_1"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden program_version: 21.18-s082_1  current program_version: [string_representation [::legacy::get_attribute program_version /]]"
}
# license
if {"[string_representation [::legacy::get_attribute startup_license /]]" != "Genus_Synthesis"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden license: Genus_Synthesis  current license: [string_representation [::legacy::get_attribute startup_license /]]"
}
# slack
set _slk_ [::legacy::get_attribute slack design:cv32e40s_core]
if {[regexp {^-?[0-9.]+$} $_slk_]} {
  set _slk_ [format %.1f $_slk_]
}
if {$_slk_ != "-646.1"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden slack: -646.1,  current slack: $_slk_"
}
unset _slk_
# multi-mode slack
# tns
set _tns_ [::legacy::get_attribute tns design:cv32e40s_core]
if {[regexp {^-?[0-9.]+$} $_tns_]} {
  set _tns_ [format %.0f $_tns_]
}
if {$_tns_ != "646"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden tns: 646,  current tns: $_tns_"
}
unset _tns_
# cell area
set _cell_area_ [::legacy::get_attribute cell_area design:cv32e40s_core]
if {[regexp {^-?[0-9.]+$} $_cell_area_]} {
  set _cell_area_ [format %.0f $_cell_area_]
}
if {$_cell_area_ != "42560"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden cell area: 42560,  current cell area: $_cell_area_"
}
unset _cell_area_
# net area
set _net_area_ [::legacy::get_attribute net_area design:cv32e40s_core]
if {[regexp {^-?[0-9.]+$} $_net_area_]} {
  set _net_area_ [format %.0f $_net_area_]
}
if {$_net_area_ != "20568"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden net area: 20568,  current net area: $_net_area_"
}
unset _net_area_
