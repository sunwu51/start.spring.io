FROM maven:3.8.4-openjdk-17-slim AS builder
WORKDIR /app
COPY . .
RUN mvn clean 
RUN mvn package -pl start-site -am -DskipTests

FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/start-site/target/start-site-exec.jar /app/start-site-exec.jar
CMD ["java", "-jar", "start-site-exec.jar"]