#!/bin/bash

TIMESTAMP=`date +"%Y%m%d-%H%M%S"`

exec /src/swift/utils/build-script \
  --preset=buildbot_linux \
  install_destdir=/install \
  installable_package=/output/swift-${TIMESTAMP}-ubuntu16.04.tar.gz \
  2>&1 | tee /output/build-${TIMESTAMP}.log
