# Verwenden Sie ein Maven-Image mit JDK 17 für den Build
FROM maven:3.8.2-openjdk-17 AS build

# Setzen Sie das Arbeitsverzeichnis auf /mule
WORKDIR /mule

# Kopieren Sie die Maven-Konfigurationsdateien und den Quellcode
COPY pom.xml .
COPY src ./src

# Führen Sie Maven aus, um das Projekt zu bauen
RUN mvn clean package -Pprod -DskipTests

# Verwenden Sie ein schlankes JDK-Image für den Laufzeitcontainer
FROM openjdk:17-jdk-alpine

# Setzen Sie das Arbeitsverzeichnis auf /mule
WORKDIR /mule

# Kopieren Sie das gebaute JAR-File vom vorherigen Build-Schritt
COPY --from=build mule/target/mule-0.0.1-SNAPSHOT.jar mule.jar

# Exponieren Sie den Port 8080
EXPOSE 8080

# Starten Sie die Anwendung
ENTRYPOINT ["java","-jar","mule.jar"]
