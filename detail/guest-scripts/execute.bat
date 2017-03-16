::
:: Parameters

@echo off

set working_dir=%1
set binary=%2


::
:: Main

cd /d %working_dir%\
%binary% %VIRTUAL_DEV_ARGUMENTS%

