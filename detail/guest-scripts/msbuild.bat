::
:: Parameters

@echo off

set working_dir=%1
set vs_version=%2


::
:: Main

setlocal enableDelayedExpansion

:: getting specific VS version path and saving it in the variable "init_vs_dev_cmd"
if %vs_version% lss 2017 (
	call :prior_vs2017
) else (
	call :vs2017_and_later
)

call %init_vs_dev_cmd% || exit 1

cd /d %working_dir%
msbuild %VIRTUAL_DEV_ARGUMENTS%
exit /b %ERRORLEVEL%


:prior_vs2017
	call set vs_comntools_path=VS%vs_version%0COMNTOOLS
	set init_vs_dev_cmd="!%vs_comntools_path%!\..\..\VC\vcvarsall.bat"
	exit /b 0

:vs2017_and_later
	set init_vs_dev_cmd="%ProgramFiles(x86)%\Microsoft Visual Studio\%vs_version%\Community\Common7\Tools\VsDevCmd.bat"
	exit /b 0

