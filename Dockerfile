FROM debian:9
MAINTAINER MqllR <>

ARG PROMETHEUS_VERSION=2.8.1
ARG ARCH=arm64
ARG PROMETHEUS_URL=https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-arm64.tar.gz

RUN apt update && \
    apt install -y wget && \
    wget ${PROMETHEUS_URL} && \
    tar xzf prometheus-${PROMETHEUS_VERSION}.linux-${ARCH}.tar.gz prometheus-${PROMETHEUS_VERSION}.linux-arm64/prometheus && \
    cp prometheus-$PROMETHEUS_VERSION.linux-arm64/prometheus .

FROM busybox:1-glibc
MAINTAINER MqllR <>

ENV PROMETHEUS_CONFIG /prometheus.yml
ENV PROMETHEUS_STORAGE /data
ENV PROMETHEUS_LOG info


COPY --from=0 /prometheus /usr/local/bin/prometheus
COPY . .

VOLUME $PROMETHEUS_STORAGE

EXPOSE 9090

ENTRYPOINT [ "./entrypoint.sh" ]
