@echo off
setlocal
set "CATALINA_HOME=%~dp0apache-tomcat-9.0.121"

if not exist "%CATALINA_HOME%\bin\shutdown.bat" (
	echo Apache Tomcat was not found at:
	echo %CATALINA_HOME%
	pause
	exit /b 1
)

echo Stopping Apache Tomcat 9...
call "%CATALINA_HOME%\bin\shutdown.bat"
echo Server stopped.
pause
