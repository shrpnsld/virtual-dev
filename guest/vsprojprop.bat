::
:: Parameters

set VS_VERSION=%1
set PROJECT_PATH=%2
set TARGET=%3
set CONFIGURATION=%4


::
:: Main

set VCVARSALL="%ProgramFiles(x86)%\Microsoft Visual Studio %VS_VERSION%.0\VC\vcvarsall.bat"

call %VCVARSALL% || exit 1

msbuild /nologo %PROJECT_PATH% /target:%TARGET% /property:configuration=%CONFIGURATION% | for /f "usebackq delims=" %%l in (`more`) do @echo %%l

