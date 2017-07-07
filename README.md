# docker-ubuntu-server
Base Ubuntu server to support the docker images
"geoceg/arcgis-server" and "geoceg/portal-for-arcgis".

This contains a few extra packages that ArcGIS Server
and Portal for ArcGIS need, to speed up building those images.

It creates a user called "arcgis".  It adds an inotify script called
"watcher.py" that arcgis can run to log notifications of changes in a
directory tree.

## Build

```
docker build -t geoceg/ubuntu-server .
```

## Run

Just for testing... you can start an instance and 
use a bash shell to explore.

```
docker run -it -rm geoceg/ubuntu-server bash
```
