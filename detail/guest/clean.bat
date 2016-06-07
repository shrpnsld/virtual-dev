::
:: Parameters

set vs_version=%1
set project_path=%2
set configuration=%3


::
:: Main

setlocal enableDelayedExpansion

:: getting specific VS version path and saving it in the variable
call set vs_comntools_path=VS%vs_version%0COMNTOOLS
set vcvarsall="!%vs_comntools_path%!\..\..\VC\vcvarsall.bat"

call %vcvarsall% || exit 1

(msbuild /nologo %project_path% /target:Clean /property:configuration=%configuration% & call doskey /exename=err err=%%^^errorlevel%%) | for /f "usebackq delims=" %%l in (`more`) do @echo %%l
for /f "tokens=2 delims==" %%A in ('doskey /m:err') do exit /b %%A

