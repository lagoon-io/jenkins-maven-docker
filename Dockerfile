# Pull base image
FROM jenkins/jenkins:lts


# Build the container
USER root

# install wget
RUN apt-get install -y wget

# get maven 3.5.4
RUN wget --no-verbose -O /tmp/apache-maven-3.5.4-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

# install maven
RUN tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.5.4 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.5.4-bin.tar.gz
ENV MAVEN_HOME /opt/maven

RUN chown -R jenkins:jenkins /opt/maven

# cleanup
RUN apt-get clean

USER jenkins
