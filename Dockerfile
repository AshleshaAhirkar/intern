# Use the official OpenJDK image for Java 11
FROM eclipse-temurin:11-jdk-alpine

# Create a volume for temporary files
VOLUME /tmp

# Copy the JAR file from the target directory to the container
COPY target/project.jar /app/project.jar

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "/app/project.jar"]

# Expose port
 EXPOSE 8005