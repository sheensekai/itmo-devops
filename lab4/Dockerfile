FROM openjdk:11 as app_jar_build_image
COPY ./devops-labs-kotlin-web-app /src/devops-labs-kotlin-web-app
WORKDIR /src/devops-labs-kotlin-web-app
RUN ./mvnw package

FROM alpine:3.15.3
RUN apk --no-cache add openjdk11-jdk openjdk11-jmods
COPY --from=app_jar_build_image /src/devops-labs-kotlin-web-app/target/devops-labs-kotlin-web-app-*.jar devops-labs-kotlin-web-app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "devops-labs-kotlin-web-app.jar"]
