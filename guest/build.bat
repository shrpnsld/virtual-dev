set VS_VERSION=%1
set SOLUTION_PATH=%2
set TARGET=%3
set CONFIGURATION=%4
set BUILD_LOG_FILE=%5
set VCVARSALL="%ProgramFiles(x86)%\Microsoft Visual Studio %VS_VERSION%.0\VC\vcvarsall.bat"

call %VCVARSALL%

rem WTF?!
call :build > %BUILD_LOG_FILE%

:build
	msbuild /nologo %SOLUTION_PATH% /target:%TARGET% /property:configuration=%CONFIGURATION%

