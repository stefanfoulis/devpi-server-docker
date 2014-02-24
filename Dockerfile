FROM ubuntu:12.04

RUN sed -i 's/main$/main universe/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python python-dev python-pip
RUN pip install -U pip
RUN pip install -U distribute
RUN pip install https://bitbucket.org/stefanfoulis/devpi/get/default.tar.gz#egg=devpi


VOLUME ["/data"]
EXPOSE 3141
ENTRYPOINT ["/usr/local/bin/devpi-server", "--serverdir", "/data", "--host", "0.0.0.0"]