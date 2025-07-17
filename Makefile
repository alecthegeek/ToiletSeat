# Generate a 3D Printer model

.SUFFIXES:

.PHONY: all edit clean

SLIC3R := "/Applications/Slic3r.app/Contents/MacOS/slic3r"
OPENSCAD := "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"

SLIC3R := "slic3r"
OPENSCAD := "openscad"

PROJECT := ToiletSeat

#Device Specefic
I4_SLIC3R_FLAGS := --nozzle-diameter=1.75 --gcode-flavor=reprap  --temperature=220

# Project specific and general flags.
SLIC3R_FLAGS := --gcode-comments --fill-density=40  $(I4_SLIC3R_FLAGS)
OPENSCAD_FLAGS := 

%.gcode: %.stl
	$(SLIC3R) $(SLIC3R_FLAGS) -o $@ $<

%.stl: %.scad $(MAKEFILE_LIST)
	$(OPENSCAD) $(OPENSCAD_FLAGS) -o $@ $<

%.png: %.scad $(MAKEFILE_LIST)
	$(OPENSCAD) $(OPENSCAD_FLAGS) -o $@ $<


all: $(PROJECT).gcode

image: $(PROJECT).png

edit:
	$(OPENSCAD) $(PROJECT).scad &
	$(VISUAL) $(PROJECT).scad &

clean:
	-rm $(PROJECT).stl $(PROJECT).gcode $(PROJECT).png

