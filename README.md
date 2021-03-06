# docker-ubuntu-server
Base Ubuntu server to support the docker images
"geoceg/arcgis-server" and "geoceg/portal-for-arcgis".

This contains a few extra packages that ArcGIS Server
and Portal for ArcGIS need, to speed up building those images.

It installs packages for python3, pip3, and uses pip to install "requests",
to make it easy to use the ArcGIS REST API.

It creates a user/group called "arcgis/arcgis" with UID/GID of 1000/1000.

The postgresql-client-9.6 package has been added to support ArcGIS 10.6.

## Build

```
docker build -t geoceg/ubuntu-server .
```

## Run

Just for testing... you can start an instance and 
use a bash shell to explore.

```
docker run -it --rm geoceg/ubuntu-server bash
```
