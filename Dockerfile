# Bước 1: Sử dụng Maven để biên dịch code Java thành file .jar
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Sử dụng OpenJDK để chạy file .jar đã biên dịch
FROM openjdk:17-jdk-slim
COPY --from=build /target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
