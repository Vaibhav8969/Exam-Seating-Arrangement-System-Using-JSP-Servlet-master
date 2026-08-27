@echo off
setlocal
echo Rebuilding Java classes...
cd /d "%~dp0Exam-Seating-Arrangement-System-Using-JSP-Servlet-master\Project\ExamSeatingArrangementSystem"
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
xcopy /s /y "web\*" "%~dp0apache-tomcat-9.0.121\webapps\ExamSeatingArrangementSystem\"
xcopy /s /y "web\*" "%~dp0apache-tomcat-9.0.121\webapps\ROOT\"

echo Rebuild and deployment complete!
pause
