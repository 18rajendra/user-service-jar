FROM openjdk:17
COPY ./target/*.jar user-server.jar
ENTRYPOINT ["java", "-jar", "user-server.jar"]