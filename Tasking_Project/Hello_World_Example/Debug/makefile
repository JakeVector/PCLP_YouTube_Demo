################################################################################
# Automatically-generated file. Do not edit!
################################################################################

PROJ 	= Hello_World_Example
PRODDIR = C:\Program Files\TASKING\TriCore v6.3r1\carm

-include "..\makefile.init"

all :

-include "subdir.mk"
-include "..\makefile.defs"

EXT_LIBRARIES =

all : "Hello_World_Example.abs"

"Hello_World_Example.abs" : $(OBJ_FILES) $(EXT_LIBRARIES) ".Hello_World_Example.abs.opt"
	@echo Linking to ${@F}
	@"${PRODDIR}\bin\ccarm" -f ".Hello_World_Example.abs.opt"

".Hello_World_Example.abs.opt" : .refresh
	@argfile ".Hello_World_Example.abs.opt" -o "Hello_World_Example.abs" $(OBJ_FILES) $(EXT_LIBRARIES) -Ccortex_m3 -t -Wl-D__DEVICE_LSL_FILE=cm3.lsl "../Hello_World_Example.lsl" -Wl-OtZxycL --no-map-file -Wl--map-file="${PROJ}.mapxml":XML -Wl-mcrfiklSmNOduQ -Wl--error-limit=42 --fpu=none --force-c++ -g --c++=14 -Wl--dep-file=".Hello_World_Example.abs.d" -Wl--make-target="Hello_World_Example.abs"
DEPENDENCY_FILES += ".Hello_World_Example.abs.d"
-include $(DEPENDENCY_FILES)

$(EXT_LIBRARIES) : .dummy

GENERATED_FILES += "Hello_World_Example.abs" "Hello_World_Example*.sre" "Hello_World_Example*.hex" "Hello_World_Example.map*" "Hello_World_Example.mdf" ".Hello_World_Example.abs.opt" ".Hello_World_Example.abs.d"
-include "..\makefile.targets"

clean : ".clean.opt"
	@echo Cleaning
	@rm -f -m ".clean.opt"

".clean.opt" : .refresh
	@argfile ".clean.opt" $(GENERATED_FILES) $(OPTIONAL_FILES)

GENERATED_FILES += ".clean.opt"
OPTIONAL_FILES +=  "*.pre" "*.lst"


.PHONY : .dummy .refresh
