# 1. Usamos una imagen con Maven y JDK para build
FROM maven:3.9.3-eclipse-temurin-17 AS build

# 2. Ponemos el código dentro del contenedor
WORKDIR /app
COPY pom.xml .
COPY src ./src

# 3. Buildamos el JAR
RUN mvn clean package -DskipTests

# 4. Imagen final solo con JDK y el JAR
FROM openjdk:17-jdk-alpine
WORKDIR /app

# Copiamos el JAR desde la etapa de build
COPY --from=build /app/target/APIREST-1.0-SNAPSHOT.jar ./APIREST.jar

# Exponemos el puerto
EXPOSE 8080

# Ejecutamos el backend
ENTRYPOINT ["java","-jar","APIREST.jar"]


