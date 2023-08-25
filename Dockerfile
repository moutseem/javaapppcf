FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean

# Set environment variables for Java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Create a directory for the application
RUN mkdir /app

# Copy the Spring Boot JAR file into the container
COPY target/hello-world-java.jar /app/app.jar

# Set the working directory
WORKDIR /app

# Expose the port your Spring Boot app will run on
EXPOSE 5000

# Entry point command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
