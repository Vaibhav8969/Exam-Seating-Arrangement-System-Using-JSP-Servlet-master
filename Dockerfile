FROM tomcat:9.0-jdk8-temurin

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/examples /usr/local/tomcat/webapps/docs

# Copy project files to a temporary build directory
COPY Project/ExamSeatingArrangementSystem /tmp/project

# Compile Java sources directly into WEB-INF/classes
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes && \
    mkdir -p /usr/local/tomcat/webapps/ExamSeatingArrangementSystem/WEB-INF/classes && \
    javac -cp "/tmp/project/lib/*:/tmp/project/web/WEB-INF/lib/*" -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /tmp/project/src/java/com/Connect.java /tmp/project/src/java/Model/*.java && \
    cp -r /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/* /usr/local/tomcat/webapps/ExamSeatingArrangementSystem/WEB-INF/classes/

# Copy all JSP, CSS, JS, images and WEB-INF assets
COPY Project/ExamSeatingArrangementSystem/web /usr/local/tomcat/webapps/ROOT
COPY Project/ExamSeatingArrangementSystem/web /usr/local/tomcat/webapps/ExamSeatingArrangementSystem

# Clean temporary project build files
RUN rm -rf /tmp/project

EXPOSE 8080

# Render and other container hosts may provide a different listening port.
CMD ["sh", "-c", "if [ -n \"$PORT\" ]; then sed -i \"s/port=\\\"8080\\\"/port=\\\"$PORT\\\"/\" \"$CATALINA_HOME/conf/server.xml\"; fi; exec catalina.sh run"]
