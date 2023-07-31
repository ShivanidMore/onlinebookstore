FROM ubuntu:22.04
WORKDIR /mnt
RUN apt update
RUN apt install default-jre -y && apt install default-jdk -y && apt install wget -y 
RUN apt install git -y && apt install unzip -y
RUN git clone https://github.com/ShivanidMore/onlinebookstore.git
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.zip
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.zip
RUN unzip apache-maven-3.9.3-bin.zip
RUN unzip apache-tomcat-9.0.78.zip
RUN chmod -R 777 apache-tomcat-9.0.78
ENV MAVEN_HOME=/mnt/apache-maven-3.9.3
ENV PATH=$MAVEN_HOME/bin:$PATH
RUN cd /mnt/onlinebookstore/ && mvn install
CMD cp /mnt/onlinebookstore/target/onlinebookstore.war /apache-tomcat-9.0.78/webapps/
EXPOSE 8080
RUN cd /mnt/apache-tomcat-9.0.78/bin/
CMD ./startup.sh
