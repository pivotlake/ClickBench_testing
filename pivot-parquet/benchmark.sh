#!/bin/bash
# Defaults are overridable by the environment so a caller (e.g. an A/B harness
# timing several builds) can point at a specific server binary, port, and
# catalog without editing this file. PIVOT_SERVER_BIN is read by ./start.
: "${PIVOT_SOURCE:=$HOME/hits}"                 # single full hits.parquet
: "${PIVOT_PORT:=7799}"
: "${PIVOT_CATALOG:=/tmp/pivot-cat-single}"
: "${BENCH_DOWNLOAD_SCRIPT:=}"                  # data already on host
: "${BENCH_RESTARTABLE:=yes}"                   # we're a server
: "${BENCH_DURABLE:=yes}"
: "${BENCH_CONCURRENT_DURATION:=1}"
export PIVOT_SOURCE PIVOT_PORT PIVOT_CATALOG
export BENCH_DOWNLOAD_SCRIPT BENCH_RESTARTABLE BENCH_DURABLE BENCH_CONCURRENT_DURATION
exec ../lib/benchmark-common.sh
