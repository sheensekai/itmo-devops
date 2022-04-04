FROM alpine:3.15.3 as system
RUN apk --no-cache add openjdk11-jdk openjdk11-jmods
ENV JAVA_MINIMAL="/opt/java-minimal"
RUN /usr/lib/jvm/java-11-openjdk/bin/jlink \
    --verbose \
    --add-modules java.base,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
    --compress 2 --strip-debug --no-header-files --no-man-pages \
    --release-info="add:IMPLEMENTOR=radistao:IMPLEMENTOR_VERSION=radistao_JRE" \
    --output "$JAVA_MINIMAL"

    
    
FROM openjdk:11 as build
COPY ./devops-labs-kotlin-web-app /src/devops-labs-kotlin-web-app
WORKDIR /src/devops-labs-kotlin-web-app
RUN ./mvnw package



FROM alpine:3.15.3
ENV JAVA_HOME=/opt/java-minimal
ENV PATH="$PATH:$JAVA_HOME/bin"

COPY --from=system "$JAVA_HOME" "$JAVA_HOME"
COPY --from=build /src/devops-labs-kotlin-web-app/target/devops-labs-kotlin-web-app-*.jar devops-labs-kotlin-web-app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "devops-labs-kotlin-web-app.jar"]
