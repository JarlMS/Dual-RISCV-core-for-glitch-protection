source "../tcl/settings.tcl"

set TIMING_CLOCK_PORT "clk"

# Setup design libraries
set_db / .library $LIB_FILES
set_db / .lef_library $LEF_FILES
set_db / .qrc_tech_file $QRC_FILES

set_db / .design_process_node 45

set_db auto_ungroup both

# Read source files
read_hdl -sv ../src/include/cv32e40s_pkg.sv

foreach sv_file [glob -nocomplain ../src/*.sv] {
	read_hdl -sv $sv_file
}

# Elaborate
elaborate $DESIGN_TOP_MODULE

# Setup timing

read_sdc ../constraints/cv32e40s_core.sdc

set_load $LOAD [all_outputs]

# Synthesis
syn_generic

syn_map

syn_opt
syn_opt -incremental

write_hdl > ../out/${DESIGN_NAME}_synth.sv
write_sdf -delimiter / -edges check_edge -no_escape -setuphold split -recrem split > $DESIGN_NAME.sdf.gz
write_spef -power > $DESIGN_NAME.spef
write_sdc > ../out/$DESIGN_NAME.sdc.gz
write_design -innovus -base_name session/$DESIGN_NAME

report_timing > reports/timing.txt
report_gates > reports/gates.txt
report_area > reports/area.txt
report_dp > reports/datapath.txt
report_power > reports/power.txt
report_sequential > reports/sequential.txt
report_clock_gating > reports/clock_gating.txt

#quit
