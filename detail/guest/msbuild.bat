::
:: Parameters

@echo off

set working_dir=%1
set vs_version=%2


::
:: Main

cd /d %working_dir%

setlocal enableDelayedExpansion

:: getting specific VS version path and saving it in the variable
call set vs_comntools_path=VS%vs_version%0COMNTOOLS
set vcvarsall="!%vs_comntools_path%!\..\..\VC\vcvarsall.bat"

call %vcvarsall% || exit 1

msbuild %virtual_dev_arguments%

