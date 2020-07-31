# Pull base image
FROM jenkins/jenkins:lts

ENV MAVEN_HOME /opt/maven

# Build the container
USER root

# install wget
RUN apt-get install -y wget \
  # get maven 3.5.4
  && wget --no-verbose -O /tmp/apache-maven-3.5.4-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz \
  # install maven
  && tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/ \
  && ln -s /opt/apache-maven-3.5.4 /opt/maven \
  && ln -s /opt/maven/bin/mvn /usr/local/bin \
  && chown -R jenkins:jenkins /opt/maven \
  # cleanup
  && rm -f /tmp/apache-maven-3.5.4-bin.tar.gz \
  && apt-get clean

USER jenkins
