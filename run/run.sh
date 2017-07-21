#!/bin/bash

set -e

notebooks_vol=${DS_NOTEBOOKS_DIR:-`pwd`/notebooks}
data_vol=${DS_DATA_DIR:-/media/data}
ssd_data_vol=${DS_SSD_DATA_DIR:-/media/ssd_data}
config_vol=${DS_CONFIG_DIR:-`pwd`/config}
secret_vol=${DS_SECRET_DIR:-`pwd`/secret}
port=${DS_PORT:-8888}
image=${DS_IMAGE:-fast_ai_part2}


nvidia-docker run --memory-swap -1 --ipc=host -p 0.0.0.0:7007:6006 -p ${port}:8888 -p 3000:3000 \
  -v ${data_vol}:/data \
  -v ${ssd_data_vol}:/ssd_data \
  -v ${notebooks_vol}:/notebooks \
  -v ${config_vol}:/jupyter/config \
  -v ${secret_vol}:/jupyter/secret \
  $@ \
  ${image}
