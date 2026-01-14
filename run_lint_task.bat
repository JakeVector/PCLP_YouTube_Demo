REM Environment variable setup for script
SET PCLP_DIR=C:\PCLint\pclp25\pclp
SET PCLP_CONFIG=%PCLP_DIR%\config
SET SRC_BASE_DIR=.\vsomeip
REM SET MAKE_EXAMPLE_BASE=C:\VCAST\2025sp5\tutorial

REM Environment variable to designate imposter output file
SET IMPOSTER_LOG=D:\Users\JColapietro\YouTube\PCLP_series\PCLP_project\lint\imposter.commands

REM Run PCLP to generate configuration files for GCC compiler
python %PCLP_CONFIG%\pclp_config.py --compiler=gcc --compiler-bin=C:\MinGW\13.3.0\mingw64\bin\gcc --config-output-lnt-file=co-gcc.lnt --config-output-header-file=co-gcc.h --generate-compiler-config

if not "%~2"=="" (
    set "UNIT_OPTION=-u"
    set "MODULE_INCLUDE_PATTERN=--module-include-pattern=%~2"
)

REM Convert backslashes to forward slashes
set "MODULE_INCLUDE_PATTERN=%MODULE_INCLUDE_PATTERN:\=\\%"

set "MODULES=%MODULE_INCLUDE_PATTERN%"

REM Run CMake build to get compile_commands JSON or Make build with imposter
pushd .\vsomeip
cmake -B build -G "Ninja" -DCMAKE_C_COMPILER=C:\MinGW\13.3.0\mingw64\bin\gcc.exe -DCMAKE_CXX_COMPILER=C:\MinGW\13.3.0\mingw64\bin\g++.exe -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
popd
REM Generate project configuration file with compile_commands.json
python %PCLP_CONFIG%\pclp_config.py --compiler=gcc --compilation-db=%SRC_BASE_DIR%\build\compile_commands.json --config-output-lnt-file=project.lnt --generate-project-config %MODULES%

REM Run PCLP analysis
%PCLP_DIR%\pclp64 co-gcc.lnt project.lnt