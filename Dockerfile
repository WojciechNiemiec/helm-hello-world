FROM adoptopenjdk:11-jre-hotspot
COPY build/libs/helm-hello-world-0.0.1-SNAPSHOT.jar /opt/app/app.jar
ENTRYPOINT ["java", "-jar", "/opt/app/app.jar"]