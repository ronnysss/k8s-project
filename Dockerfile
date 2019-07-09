FROM ubuntu
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update && add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && apt-get install -y openjdk-8-jdk
RUN java -version
RUN mkdir myservices
COPY target/spring-boot-web-0.0.1-SNAPSHOT.jar myservices/
ENTRYPOINT ["java", "-jar", "-Dserver.port=9000", "myservices/spring-boot-web-0.0.1-SNAPSHOT.jar"]

