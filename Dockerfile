# Use the official OpenJDK image for Java 11
FROM eclipse-temurin:11-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the target directory to the container
COPY target/*.jar app.jar

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

# Expose port 8005
EXPOSE 8005