devpi-server
============

This is a slightly modified version of devpi server.
The difference to mainline is, that you can't add new users unless you are root.

To just run the built image from the docker index::

    # create a data container
    docker run -d -v /data --name devpi-server-data ubuntu:12.04
    # launch the container
    docker run -d -p 127.0.0.1:3141:3141 -i -t -volumes-from devpi-server-data -name devpi-server10 aldryn/devpi-server:latest
    docker run -d -p 127.0.0.1:3141:3141 -i -t -volumes-from devpi-server-data -name devpi-server10 aldryn/devpi-server:v6


TODO: describe local development
