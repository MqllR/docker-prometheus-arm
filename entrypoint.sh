#!/bin/sh

prometheus --config.file=$PROMETHEUS_CONFIG \
           --storage.tsdb.path=$PROMETHEUS_STORAGE \
           --log.level=$PROMETHEUS_LOG
