# Multi-stage build for Exam Seating Arrangement System (JSP + Servlet + Tomcat 9)
FROM openjdk:8-jdk-slim AS builder

WORKDIR /app
COPY Project/ExamSeatingArrangementSystem /app

# Compile all Java sources into build/classes
RUN mkdir -p build/classes && \
    javac -cp "lib/*:web/WEB-INF/lib/*" -d build/classes src/java/com/Connect.java src/java/Model/*.java

# Runtime Stage: Apache Tomcat 9
FROM tomcat:9.0-jdk8-openjdk-slim

# Remove default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/examples /usr/local/tomcat/webapps/docs

# Copy web files to ROOT and context path
COPY Project/ExamSeatingArrangementSystem/web /usr/local/tomcat/webapps/ROOT
COPY Project/ExamSeatingArrangementSystem/web /usr/local/tomcat/webapps/ExamSeatingArrangementSystem

# Copy compiled classes from builder stage
COPY --from=builder /app/build/classes /usr/local/tomcat/webapps/ROOT/WEB-INF/classes
COPY --from=builder /app/build/classes /usr/local/tomcat/webapps/ExamSeatingArrangementSystem/WEB-INF/classes

# Ensure library JARs are present in WEB-INF/lib
COPY Project/ExamSeatingArrangementSystem/web/WEB-INF/lib/* /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/
COPY Project/ExamSeatingArrangementSystem/web/WEB-INF/lib/* /usr/local/tomcat/webapps/ExamSeatingArrangementSystem/WEB-INF/lib/

EXPOSE 8080

CMD ["catalina.sh", "run"]
