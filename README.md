This repository contains all the scripting and lint files for the 'All Things PC-lint Plus' YouTube Series.
The main script for most of the work is in lint\run_lint.bat. The run_lint_task.bat is a script specific to
setting up the integration with VSCode. Everything should be able to run right out of the box, with respect to
a few changes that are necessary for the run_lint.bat script. Those changes are as follows:
Environment variables on line 2, 5, and 6
--compiler-bin= option on line 14
-DCMAKE_C_COMPILER= and -DCMAKE_CXX_COMPILER= on line 19
