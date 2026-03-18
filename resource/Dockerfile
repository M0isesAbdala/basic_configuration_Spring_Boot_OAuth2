FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

RUN apk add --no-cache curl bash

EXPOSE $RESOURCE_PORT

ENTRYPOINT ["sh", "-c", "sleep 10; until curl -f ${AUTHENTICATION_URL}:${AUTHENTICATION_PORT}/.well-known/openid-configuration; do echo 'Resource guardando auth...'; sleep 3; done && java -jar app.jar"]