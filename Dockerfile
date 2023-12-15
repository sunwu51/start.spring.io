# FROM maven:3.8.4-openjdk-17-slim AS builder
# WORKDIR /app
# COPY . .
# RUN mvn clean 
# 这个构建还需要nodejs和yarn过程太慢了，直接构建好传到repo了
# RUN mvn package -DskipTests

FROM openjdk:17
WORKDIR /app
# COPY --from=builder /app/start-site/target/start-site-exec.jar /app/start-site-exec.jar
COPY start-site-exec.jar .
CMD ["java", "-jar", "start-site-exec.jar"]