FROM maven:3.9.5-amazoncorretto-21
# Set the working directory to /opt/app
WORKDIR /opt/app
# Copy the Maven project to the container workplace to isolate service
COPY pom.xml /opt/app/
COPY src /opt/app/src
# Build the application
RUN mvn clean package -DskipTests
# Environment variable for Spring profile
ENV SPRING_PROFILES_ACTIVE=prod
# Copy the built JAR to the working directory
COPY target/app.jar /opt/app/app.jar
# Expose the application port
EXPOSE 80
# Set the entrypoint for the container
ENTRYPOINT ["java", "-Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}", "-jar", "/opt/app/app.jar"]