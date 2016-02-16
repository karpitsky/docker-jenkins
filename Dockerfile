FROM ubuntu:14.04

RUN apt-get update && apt-get clean

RUN apt-get install -q -y openjdk-7-jdk && apt-get clean
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
RUN ln -sf /jenkins /root/.jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
VOLUME ["/jenkins"]
CMD [""]
