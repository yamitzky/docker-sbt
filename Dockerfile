FROM openjdk:8-jre

RUN curl -sL https://dl.bintray.com/sbt/native-packages/sbt/0.13.13/sbt-0.13.13.zip > /tmp/sbt.zip && \
  unzip /tmp/sbt.zip -d /tmp && \
  cp -r /tmp/sbt-launcher-packaging-0.13.13/* /usr/local/ && \
  sbt about

RUN apt-get update -y --fix-missing && \
  apt-get install -y \
  openssh-client \
  git

WORKDIR /usr/src/app

CMD sbt
