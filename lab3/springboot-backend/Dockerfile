FROM openjdk:12-alpine as build
COPY ./ /src/springboot-backend
WORKDIR /src/springboot-backend
RUN chmod +x mvnw
RUN ./mvnw package

FROM openjdk:12-alpine
COPY --from=build /src/springboot-backend/target/springboot-backend-*.jar springboot-backend.jar
ENTRYPOINT ["java", "-jar", "springboot-backend.jar"]
