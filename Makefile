# Generate a 3D Printer model

PROJECT := ToiletSeat

.SUFFIXES:

.PHONY: all edit clean gcode image stl

# Use for macOS
SLIC3R := "/Applications/Slic3r.app/Contents/MacOS/slic3r"
OPENSCAD := "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"

# Use for Linux
SLIC3R := "slic3r"
OPENSCAD := "openscad"


#Device Specefic
I4_SLIC3R_FLAGS := --nozzle-diameter=1.75 --gcode-flavor=reprap  --temperature=220

# Project specific and general flags.
SLIC3R_FLAGS := --gcode-comments --fill-density=40  $(I4_SLIC3R_FLAGS)
OPENSCAD_FLAGS := 

all: gcode image stl

gcode: $(PROJECT).gcode

image: $(PROJECT).png

stl: $(PROJECT).stl


edit:
	$(OPENSCAD) $(PROJECT).scad &
	$(VISUAL) $(PROJECT).scad &

clean:
	-rm $(PROJECT).stl $(PROJECT).gcode $(PROJECT).png

%.gcode: %.stl
	$(SLIC3R) $(SLIC3R_FLAGS) -o $@ $<

%.stl: %.scad $(MAKEFILE_LIST)
	$(OPENSCAD) $(OPENSCAD_FLAGS) -o $@ $<

%.png: %.scad $(MAKEFILE_LIST)
	$(OPENSCAD) $(OPENSCAD_FLAGS) -o $@ $<

