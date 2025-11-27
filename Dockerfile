FROM maven:3.8.7-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml ./

COPY src ./src

RUN mvn clean package

#Stage 2
FROM eclipse-temurin:17-jdk

EXPOSE 8085

COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
