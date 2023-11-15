# Pull base image 
FROM tomcat:8.5-jre8 

# Maintainer 
LABEL "author"="guylandrychoups@gmail.com"
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps
