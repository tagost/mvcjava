FROM tomcat:8.0.15-jre8
COPY web/librerias /usr/local/tomcat/lib
COPY mvcjava.war /usr/local/tomcat/webapps/
