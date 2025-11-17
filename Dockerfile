# Use an official Tomcat image with OpenJDK 11
FROM tomcat:9.0-jdk11-openjdk

# Remove default webapps to avoid name conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR to Tomcat webapps as ROOT.war
# Ensure you run 'mvn package' before building the Docker image
COPY target/quiz2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
