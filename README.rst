devpi-server
============

This is a slightly modified version of devpi server.
The difference to mainline is, that you can't add new users unless you are root.

To just run the built image from the docker index::

    # create a data container
    docker run -d -v /data --name devpi-server-data ubuntu:12.04
    # launch the container
    docker run -i -d -p 0.0.0.0:$HOSTPORT:3141 -volumes-from devpi-server-data stefanfoulis/devpi-server


TODO: describe local development
