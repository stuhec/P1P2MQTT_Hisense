@echo off
setlocal

set PYTHON_EXE=C:\Users\user\AppData\Local\Programs\Python\Python313\python.exe
set BRIDGE_DIR=%~dp0examples\P1P2MQTT-bridge
set MONITOR_DIR=%~dp0examples\P1P2Monitor

cd /d "%BRIDGE_DIR%"
echo Building Hitachi bridge in %CD%...
"%PYTHON_EXE%" -m platformio run -e Hitachi-OTA
if errorlevel 1 (
    echo Bridge build failed.
    exit /b 1
)

echo.
echo Uploading Hitachi bridge...
"%PYTHON_EXE%" -m platformio run -e Hitachi-OTA -t upload
if errorlevel 1 (
    echo Bridge upload failed.
    exit /b 1
)

echo.
echo Building Hitachi monitor in %MONITOR_DIR%...
cd /d "%MONITOR_DIR%"
"%PYTHON_EXE%" -m platformio run -e Hitachi
if errorlevel 1 (
    echo Monitor build failed.
    exit /b 1
)

echo.
echo Uploading Hitachi monitor...
"%PYTHON_EXE%" -m platformio run -e Hitachi -t upload
if errorlevel 1 (
    echo Monitor upload failed.
    exit /b 1
)

echo.
echo Build and upload complete.
exit /b 0
