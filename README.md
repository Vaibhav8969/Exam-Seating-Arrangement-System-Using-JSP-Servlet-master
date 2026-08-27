# Exam Seating Arrangement System

## Description
The Exam Seating Arrangement System is a robust web application designed to automate and simplify the process of allocating seats to students during examinations. By efficiently managing blocks, rooms, and student registrations, the system minimizes manual administrative overhead, eliminates human errors, and ensures an organized, fair, and transparent examination environment. 

## Technologies Used
- **Backend:** Java, Servlets, JSP
- **Database:** MySQL
- **Frontend:** HTML, CSS, jQuery
- **Build Tool:** Ant (NetBeans based)

## Prerequisites
Before you begin, ensure you have met the following requirements:
- **Java Development Kit (JDK):** Version 8 or higher
- **Web Server:** Apache Tomcat 8+ or GlassFish
- **Database:** MySQL Server and MySQL Workbench (or any MySQL client)
- **IDE (Optional but recommended):** NetBeans IDE

## Getting Started

### 1. Database Setup
1. Open your MySQL client (e.g., MySQL Workbench).
2. Locate the database script at `DatabaseScript/esas.sql`.
3. Execute the SQL script to create the `esas` database and all required tables.
4. Ensure your MySQL server is running on `localhost` at port `3306` with the username `root` and password `root`. 
   - *(Note: If your credentials differ, update the database connection strings in `Project/ExamSeatingArrangementSystem/src/java/com/Connect.java`)*.

### 2. Running the Application
#### Using Apache Tomcat on Windows
1. Install Apache Tomcat 9.0.121 into the repository folder so this path exists: `apache-tomcat-9.0.121\bin\startup.bat`.
2. Run `rebuild-and-deploy.bat` from the repository root.
3. Run `start-server.bat`.
4. Open `http://localhost:8080/ExamSeatingArrangementSystem/`.

Do not open the JSP files with Live Server or by double-clicking them. JSP runs inside Tomcat, not in a static file server. NetBeans users can instead open `Project/ExamSeatingArrangementSystem`, select a configured Tomcat server, clean/build, and run the project.

#### Using Docker
Run `docker compose up --build` from the repository root, then open `http://localhost:8080/`. The Docker image deploys the JSP application as the Tomcat root application and also keeps the `/ExamSeatingArrangementSystem/` context available.

#### Using Vercel
Vercel serves the static project information page at `/`. Vercel does not execute Java, JSP, Servlets, or connect to the Docker MySQL service, so the complete admin application must be deployed with Docker on Render, Railway, or another Tomcat-capable host. Deploy this repository to Vercel by selecting the repository root as the project root and leaving the framework preset as `Other`.

### 3. Default Credentials
- **Admin Username:** admin
- **Admin Password:** test

## License
This project is open-source and available for educational purposes.
