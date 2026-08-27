@echo off
setlocal
set "PROJECT_DIR=%~dp0Project\ExamSeatingArrangementSystem"
set "TOMCAT_HOME=%~dp0apache-tomcat-9.0.121"

if not exist "%TOMCAT_HOME%\bin\startup.bat" (
    echo Apache Tomcat was not found at:
    echo %TOMCAT_HOME%
    echo Install Apache Tomcat 9.0.121 there, or update TOMCAT_HOME in this script.
    pause
    exit /b 1
)

echo Rebuilding Java classes...
cd /d "%PROJECT_DIR%"
if not exist "build\classes" mkdir "build\classes"
javac -cp "lib/*;web/WEB-INF/lib/*" -d "build/classes" src/java/com/Connect.java src/java/Model/*.java
if errorlevel 1 (
    echo Compilation failed!
    pause
    exit /b 1
)

echo Copying classes and web files to Tomcat webapps...
if not exist "web\WEB-INF\classes" mkdir "web\WEB-INF\classes"
xcopy /s /y "build\classes\*" "web\WEB-INF\classes\"
if not exist "%TOMCAT_HOME%\webapps\ExamSeatingArrangementSystem" mkdir "%TOMCAT_HOME%\webapps\ExamSeatingArrangementSystem"
xcopy /e /i /y "web\*" "%TOMCAT_HOME%\webapps\ExamSeatingArrangementSystem\"

echo Rebuild and deployment complete!
echo URL: http://localhost:8080/ExamSeatingArrangementSystem/
pause
