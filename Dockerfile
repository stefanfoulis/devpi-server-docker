FROM ubuntu:12.04

RUN sed -i 's/main$/main universe/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python python-dev python-pip curl
RUN pip install -U pip
RUN pip install -U distribute
RUN pip install eventlet==0.15.0

#ADD src/devpi /code
RUN mkdir /code
RUN chmod 777 /code
RUN cd /tmp && curl https://bitbucket.org/hpk42/devpi/get/3b044257e9d1.tar.gz | tar zx
RUN mv /tmp/hpk42-devpi-3b044257e9d1/common /code/
RUN mv /tmp/hpk42-devpi-3b044257e9d1/server /code/
RUN mv /tmp/hpk42-devpi-3b044257e9d1/client /code/
RUN cd /code/common/ && python setup.py develop
RUN cd /code/server/ && python setup.py develop
RUN cd /code/client/ && python setup.py develop

VOLUME ["/data"]
EXPOSE 3141
CMD /usr/local/bin/devpi-server --serverdir /data --host 0.0.0.0
