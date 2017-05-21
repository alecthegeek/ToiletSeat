# Generate a 3D Printer model

.SUFFIXES:

I4_SLIC3R_FLAGS := --nozzle-diameter=1.75 --gcode-flavor=reprap  --temperature=220

SLIC3R := "/Applications/Slic3r.app/Contents/MacOS/slic3r"
SLIC3R_FLAGS := --gcode-comments --fill-density=40  $(I4_SLIC3R_FLAGS)
OPENSCAD := "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
OPENSCAD_FLAGS := 

%.gcode: %.stl
	$(SLIC3R) $(SLIC3R_FLAGS) -o $@ $<

%.stl: %.scad $(MAKEFILE_LIST)
	$(OPENSCAD) $(OPENSCAD_FLAGS) -o $@ $<


PROJECT := ToiletSeat

all: $(PROJECT).gcode

