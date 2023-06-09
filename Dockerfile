FROM openjdk:11.0.4-jre-slim

ENV APP_HOME /opt/app

COPY target/*.jar ${APP_HOME}/app.jar

WORKDIR ${APP_HOME}

CMD exec java -jar app.jar