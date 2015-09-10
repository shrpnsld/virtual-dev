set SOLUTION_DIR=%1
set OUT_DIR=%2
set TARGET=%3

rem Dealing with relative paths
cd /d %SOLUTION_DIR%
cd /d %OUT_DIR%

%TARGET%

