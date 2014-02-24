FROM ubuntu:12.04

RUN sed -i 's/main$/main universe/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python python-dev python-pip curl
RUN pip install -U pip
RUN pip install -U distribute
RUN cd /tmp && curl https://bitbucket.org/stefanfoulis/devpi/get/18b6af2960b6.tar.gz | tar zx
RUN cd /tmp/stefanfoulis-devpi-18b6af2960b6/server/ && python setup.py develop
RUN cd /tmp/stefanfoulis-devpi-18b6af2960b6/client/ && python setup.py develop


VOLUME ["/data"]
EXPOSE 3141
ENTRYPOINT ["/usr/local/bin/devpi-server", "--serverdir", "/data", "--host", "0.0.0.0"]