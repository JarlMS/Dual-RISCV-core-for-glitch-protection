DESIGN_NAME=cv32e40s_core

SOURCES = $(wildcard ./src/*)

.PHONY : syn 
syn :
	mkdir -p build
	mkdir -p out
	cd build && genus -file ../tcl/synth.tcl

.PHONY : clean 
clean : 
	rm -rf build out genus.log* genus.cmd*

