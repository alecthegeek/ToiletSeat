# Generate a 3D Printer model

.SUFFIXES:

SLIC3R := "/Applications/Slic3r.app/Contents/MacOS/slic3r"
SLIC3R_FLAGS := 
OPENSCAD := "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
OPENSCAD_FLAGS := 

PROJECT := ToiletSeat

all: $(PROJECT).gcode


%.gcode: %.stl
	$(SLIC3R) $(SLIC3R_FLAGS) -o $@ $<

%.stl: %.scad
	$(OPENSCAD) $(OPENSCAD_FLAGS) -o $@ $<

