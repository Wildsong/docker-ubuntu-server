# docker-ubuntu-server
Base Ubuntu server to support the docker images
"geo-ceg/arcgis-server" and "geo-ceg/portal-for-arcgis".

This contains a few extra packages that ArcGIS Server
and Portal for ArcGIS need, to speed up building those images.

## Build

```
docker build -t geo-ceg/ubuntu-server .
```

## Run

Just for testing...

```
docker run -it geo-ceg/ubuntu-server bash
```

