@echo off
setlocal
set "CATALINA_HOME=%~dp0apache-tomcat-9.0.121"

echo Stopping Apache Tomcat 9...
call "%CATALINA_HOME%\bin\shutdown.bat"
echo Server stopped.
pause
