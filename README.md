# Docker image for Prometheus on arm64 architecture

Small dockerfile for running on arm64 architecture.

* Simple Run
```
docker run -d -p 9090:9090
	--name prometheus
        -v /data:/data
	-v $PWD/prometheus.yml:/prometheus.yml
        mqll/prometheus-arm
```
