# ==========================================
# STAGE 1: Build WAR with Maven & Java 21
# ==========================================
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

# Copy Maven descriptor and source code
COPY pom.xml .
COPY src ./src

# Build production WAR package
RUN mvn clean package -DskipTests

# ==========================================
# STAGE 2: Run with Apache Tomcat 10.1
# ==========================================
FROM tomcat:10.1-jdk21-temurin
WORKDIR /usr/local/tomcat

# Remove default Tomcat demo webapps
RUN rm -rf webapps/*

# Deploy our application as ROOT.war (served at https://<your-app>.onrender.com/)
COPY --from=build /app/target/FashionStore.war webapps/ROOT.war

# Expose HTTP port
EXPOSE 8080

# Adapt server.xml to dynamic $PORT assigned by Render (defaults to 8080)
CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-8080}\\\"/g\" conf/server.xml && catalina.sh run"]
