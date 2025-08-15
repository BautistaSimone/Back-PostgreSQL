# Usamos la imagen oficial de Java 17
FROM openjdk:17-jdk-alpine

# Ponemos el JAR dentro del contenedor
COPY target/APIREST-1.0-SNAPSHOT.jar /app/APIREST.jar

# Ponemos el directorio de trabajo
WORKDIR /app

# Exponemos el puerto 8080
EXPOSE 8080

# Comando para ejecutar tu backend
ENTRYPOINT ["java","-jar","APIREST.jar"]

