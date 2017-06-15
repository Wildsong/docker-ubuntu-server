# docker-ubuntu-server
Base Ubuntu server to support geo-ceg/arcgis-server.

This contains a few extra packages that arcgis-server needs,
to speed up building that image.

## Build

```
docker build -t geo-ceg/ubuntu-server .
```

## Run

Just for testing...

```
docker run -it geo-ceg/ubuntu-server bash
```

