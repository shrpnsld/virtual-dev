::
:: Parameters

set VS_VERSION=%1
set SOLUTION_PATH=%2
set TARGET=%3
set CONFIGURATION=%4


::
:: Main

:: getting specific VS version path and saving it in the variable
for /f "delims=" %i ('call echo %VS%%VS_VERSION%0COMNTOOLS%') do set VS_COMNTOOLS_PATH=%i

set VCVARSALL="%VS_COMNTOOLS_PATH%\..\..\VC\vcvarsall.bat"

call %VCVARSALL% || exit 1

(msbuild /nologo %SOLUTION_PATH% /target:%TARGET% /property:configuration=%CONFIGURATION% & call doskey /exename=err err=%%^^errorlevel%%) | for /f "usebackq delims=" %%l in (`more`) do @echo %%l
for /f "tokens=2 delims==" %%A in ('doskey /m:err') do exit /b %%A
