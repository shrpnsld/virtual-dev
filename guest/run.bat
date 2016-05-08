::
:: Parameters

set solution_dir=%1
set out_dir=%2
set target=%3


::
:: Main

:: Dealing with relative paths
cd /d %solution_dir% || exit %errorlevel%
cd /d %out_dir% || exit %errorlevel%

%target%

