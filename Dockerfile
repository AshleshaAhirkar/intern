# Use the official OpenJDK image for Java 11
FROM eclipse-temurin:11-jdk-alpine

# Create a volume for temporary files
VOLUME /tmp

# Copy the JAR file from the target directory to the container
COPY target/*.jar app.jar

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Expose port
 EXPOSE 8005