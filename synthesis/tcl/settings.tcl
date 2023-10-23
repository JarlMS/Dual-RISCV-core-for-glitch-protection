set DESIGN_NAME "cv32e40s"
set DESIGN_TOP_MODULE "cv32e40s_core"

# V, degC, ns, pf
set TIMING_CLOCK_PERIOD 5405
set TIMING_INPUT_DELAY 0.2
set TIMING_OUTPUT_DELAY 15
set LOAD 0.1

set PATH_LIB_BASE "/eda/kits/cadence/45nm/gsclib045_all_v4.4"
set PATH_TECHNOKIT "$PATH_LIB_BASE/gsclib045_tech/"

set LIB_FILES {}
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v0_basicCells.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v0_extvdd1v0.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v0_extvdd1v2.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v0_multibitsDFF.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v2_basicCells.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v2_extvdd1v0.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v2_extvdd1v2.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/fast_vdd1v2_multibitsDFF.lib

lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v0_basicCells.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v0_extvdd1v0.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v0_extvdd1v2.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v0_multibitsDFF.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v2_basicCells.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v2_extvdd1v0.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v2_extvdd1v2.lib
lappend LIB_FILES ${PATH_LIB_BASE}/gsclib045/timing/slow_vdd1v2_multibitsDFF.lib

set slow_libs {}
lappend slow_libs ${PATH_LIB_BASE}/gsclib045_lvt/timingfast_vdd1v0_basicCells_lvt.lib
lappend slow_libs ${PATH_LIB_BASE}/gsclib045_lvt/timingfast_vdd1v2_basicCells_lvt.lib
lappend slow_libs ${PATH_LIB_BASE}/gsclib045_lvt/timingslow_vdd1v0_basicCells_lvt.lib
lappend slow_libs ${PATH_LIB_BASE}/gsclib045_lvt/timingslow_vdd1v2_basicCells_lvt.lib

set fast_libs {}
lappend fast_libs ${PATH_LIB_BASE}/gsclib045_hvt/timing/fast_vdd1v0_basicCells_hvt.lib
lappend fast_libs ${PATH_LIB_BASE}/gsclib045_hvt/timing/fast_vdd1v2_basicCells_hvt.lib
lappend fast_libs ${PATH_LIB_BASE}/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib
lappend fast_libs ${PATH_LIB_BASE}/gsclib045_hvt/timing/slow_vdd1v2_basicCells_hvt.lib

set LEF_FILES {}
lappend LEF_FILES $PATH_TECHNOKIT/lef/gsclib045_tech.lef
lappend LEF_FILES $PATH_LIB_BASE/gsclib045/lef/gsclib045_macro.lef
lappend LEF_FILES $PATH_LIB_BASE/gsclib045/lef/gsclib045_multibitsDFF.lef
lappend LEF_FILES $PATH_LIB_BASE/gsclib045/lef/gsclib045_tech.lef
lappend LEF_FILES $PATH_LIB_BASE/gsclib045_backbias/lef/gsclib045_backbias_macro.lef
lappend LEF_FILES $PATH_LIB_BASE/gsclib045_hvt/lef/gsclib045_hvt_macro.lef
lappend LEF_FILES $PATH_LIB_BASE/gsclib045_lvt/lef/gsclib045_lvt_macro.lef

set QRC_FILES {}
lappend QRC_FILES $PATH_TECHNOKIT/qrc/qx/gpdk045.tch
