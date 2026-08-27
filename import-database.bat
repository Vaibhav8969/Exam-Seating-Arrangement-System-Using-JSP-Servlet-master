@echo off
setlocal
echo ======================================================================
echo Importing esas.sql into MySQL Database...
echo ======================================================================
set /p MYSQL_PWD="Enter your MySQL root password: "
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p"%MYSQL_PWD%" < "%~dp0Exam-Seating-Arrangement-System-Using-JSP-Servlet-master\DatabaseScript\esas.sql"
if errorlevel 1 (
    echo.
    echo [ERROR] Database import failed. Please check your password.
) else (
    echo.
    echo [SUCCESS] Database 'esas' imported successfully!
)
pause
