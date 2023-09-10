FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG EXTRACTED=target/extracted
COPY ${EXTRACTED}/dependencies/ ./
COPY ${EXTRACTED}/spring-boot-loader/ ./
COPY ${EXTRACTED}/snapshot-dependencies/ ./
COPY ${EXTRACTED}/application/ ./
ENTRYPOINT ["java","-Dspring.profiles.active=postgres", "org.springframework.boot.loader.JarLauncher"]

# spring.profiles.active=postgres
