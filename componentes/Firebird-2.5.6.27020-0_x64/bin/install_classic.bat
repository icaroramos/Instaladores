@echo off
if "%1"=="" (
%AndesFB25%instreg install -z
)
setlocal
set INSTALL_SERVICE=install -auto -classic -z
set START_SERVICE=start
if not "%1"=="" (
set INSTALL_SERVICE=%INSTALL_SERVICE% -n %1
set START_SERVICE=%START_SERVICE% -n %1
)
%AndesFB25%instsvc %INSTALL_SERVICE%
%AndesFB25%instsvc %START_SERVICE%
endlocal