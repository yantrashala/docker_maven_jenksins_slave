FROM maven:3-jdk-8-alpine
MAINTAINER Ponnusamy<agoldgodatgmail.com>
RUN apk --update --no-cache add bash git openssh openjdk8 docker && \
  ssh-keygen -A && \
  rm -rf /var/cache/apk/* && \
  adduser -D jenkins && \
  echo "jenkins:jenkins" | chpasswd 
COPY settings-docker.xml /usr/share/maven/ref/
EXPOSE 22
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV M2_REPO /home/jenkins/.m2
VOLUME /home/jenkins/.m2
CMD ["/usr/sbin/sshd","-D"]