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
1. Open your preferred IDE (e.g., NetBeans).
2. Import/Open the project by selecting the `Project/ExamSeatingArrangementSystem` folder.
3. Resolve any missing server dependencies by adding Apache Tomcat or GlassFish to your project configuration.
4. Clean and Build the project.
5. Run the project. The IDE will deploy the application to the configured web server and launch it in your default browser.

### 3. Default Credentials
- **Admin Username:** admin
- **Admin Password:** test

## License
This project is open-source and available for educational purposes.
