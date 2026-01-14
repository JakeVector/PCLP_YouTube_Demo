################################################################################
# Automatically-generated file. Do not edit!
################################################################################

C++_FILES += "..\Hello_World_Example.cpp"
OBJ_FILES += "Hello_World_Example.obj"
"Hello_World_Example.obj" : "..\Hello_World_Example.cpp" ".Hello_World_Example.obj.opt"
	@echo Compiling ${<F}
	@"${PRODDIR}\bin\ccarm" -f ".Hello_World_Example.obj.opt"

".Hello_World_Example.obj.opt" : .refresh
	@argfile ".Hello_World_Example.obj.opt" -o "Hello_World_Example.obj" "..\Hello_World_Example.cpp" -Ccortex_m3 -t -Wa-gAHLs -Wa--error-limit=42 --c++=14 --iso=11 --language=-gcc,-volatile,+strings,-kanji -O1 --tradeoff=4 -g --error-limit=42 --source --instantiate=used -c --dep-file=".Hello_World_Example.obj.d" -Wcp--make-target="Hello_World_Example.obj"
DEPENDENCY_FILES += ".Hello_World_Example.obj.d"


GENERATED_FILES += "Hello_World_Example.obj" ".Hello_World_Example.obj.opt" ".Hello_World_Example.obj.d" "Hello_World_Example.src" "Hello_World_Example.lst" "Hello_World_Example.ic"
