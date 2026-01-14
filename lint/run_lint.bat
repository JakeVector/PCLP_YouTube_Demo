REM Environment variable setup for script
SET PCLP_DIR=C:\PCLint\pclp25_new\pclp
SET PCLP_CONFIG=%PCLP_DIR%\config
SET SRC_BASE_DIR=..\vsomeip
SET MAKE_EXAMPLE_BASE=C:\VCAST\2025sp5\tutorial

REM Environment variable to designate imposter output file
SET IMPOSTER_LOG=D:\Users\JColapietro\YouTube\PCLP_series\PCLP_project\lint\imposter.commands

SET PROJECT_CONFIG=%1
echo %PROJECT_CONFIG%

REM Run PCLP to generate configuration files for GCC compiler
python %PCLP_CONFIG%\pclp_config.py --compiler=gcc --compiler-bin=C:\MinGW\13.3.0\mingw64\bin\gcc --config-output-lnt-file=co-gcc.lnt --config-output-header-file=co-gcc.h --generate-compiler-config

REM Run CMake build to get compile_commands JSON or Make build with imposter
if "%PROJECT_CONFIG%"=="json" (
    pushd ..\vsomeip
    cmake -B build -G "Ninja" -DCMAKE_C_COMPILER=C:\MinGW\13.3.0\mingw64\bin\gcc.exe -DCMAKE_CXX_COMPILER=C:\MinGW\13.3.0\mingw64\bin\g++.exe -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    popd
    REM Generate project configuration file with compile_commands.json
    python %PCLP_CONFIG%\pclp_config.py --compiler=gcc --compilation-db=%SRC_BASE_DIR%\build\compile_commands.json --config-output-lnt-file=project.lnt --generate-project-config

    REM Run PCLP with JSON input
    %PCLP_DIR%\pclp64 co-gcc.lnt -server_data=.\view_json\json options.lnt project.lnt

    REM Run PCLP View Agent to visualize results with JSON configuration
    java -jar %PCLP_DIR%\..\pclpview-agent.jar -t eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEwMCwiaWF0IjoxNzY4MzMyNjYxMzM4LCJyZWFkLW9ubHkiOjB9.QIGssiPo4UFOwKgDhGztL33XKyWQzjOMhajwpHTJ4vQ= http://localhost:8280 -- --name="View_Demo_Project_JSON" --dp="type=pclp,pclp_dir=D:\Users\JColapietro\YouTube\PCLP_series\PCLP_project\lint\view_json\json" --repository="type=scm_auto,path=D:\Users\JColapietro\YouTube\PCLP_series\PCLP_project\vsomeip\implementation"
) else if "%PROJECT_CONFIG%"=="imposter" (
    if exist imposter.commands del imposter.commands
    type nul > imposter.commands
    pushd %MAKE_EXAMPLE_BASE%\cpp
    if exist Manager_app.exe (
        make clean
    )
    make -e CXX=%PCLP_CONFIG%\imposter.exe Manager_app
    popd
    REM Generate project configuration file with imposter.commands
    python %PCLP_CONFIG%\pclp_config.py --compiler=gcc --imposter-file=imposter.commands --config-output-lnt-file=project.lnt --generate-project-config
    
    REM Run PCLP with imposter configuration
    %PCLP_DIR%\pclp64 co-gcc.lnt -server_data=.\view_json\imposter options.lnt project.lnt

    REM Run PCLP View Agent to visualize results with imposter configuration
    java -jar %PCLP_DIR%\..\pclpview-agent.jar -t eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEwMCwiaWF0IjoxNzY4MzMyNjYxMzM4LCJyZWFkLW9ubHkiOjB9.QIGssiPo4UFOwKgDhGztL33XKyWQzjOMhajwpHTJ4vQ= http://localhost:8280 -- --name="View_Demo_Project_Imposter" --dp="type=pclp,pclp_dir=D:\Users\JColapietro\YouTube\PCLP_series\PCLP_project\lint\view_json\imposter" --repository="type=scm_auto,path=C:\VCAST\2025sp5\tutorial\cpp"
)