FROM openjdk:8
EXPOSE 8080
ADD target/spring-boot-test1.jar spring-boot-test1.jar 
ENTRYPOINT ["java","-jar","/spring-boot-test1.jar"]
