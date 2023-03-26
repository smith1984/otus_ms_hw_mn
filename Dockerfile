#Build stage
FROM maven:3.8.3-openjdk-17 AS build

WORKDIR /ServerApplication
ADD . /ServerApplication

RUN mvn package

#Final stage
FROM openjdk:17-alpine

WORKDIR /app
COPY --from=build /ServerApplication/target/monitoring-0.0.1.jar /app/monitoring.jar

ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-jar", "/app/monitoring.jar"]
