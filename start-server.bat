@echo off
setlocal
set "CATALINA_HOME=%~dp0apache-tomcat-9.0.121"

echo ======================================================================
echo Starting Exam Seating Arrangement System on Apache Tomcat 9...
echo ======================================================================

call "%CATALINA_HOME%\bin\startup.bat"

echo.
echo Application server is starting!
echo URL: http://localhost:8080/ExamSeatingArrangementSystem/
echo URL: http://localhost:8080/
echo.
echo To stop server, run stop-server.bat
pause
