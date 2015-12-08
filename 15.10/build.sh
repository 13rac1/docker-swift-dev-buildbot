#!/bin/bash

export SWIFT_BUILD_ROOT=${BUILD}

TIMESTAMP=`date +"%Y%m%d-%H%M%S"`

${SOURCE}/swift/utils/build-script \
  --preset=buildbot_linux_1510 \
  install_destdir=${INSTALL} \
  installable_package=${OUTPUT}/swift-${TIMESTAMP}-ubuntu15.10.tar.gz \
  2>&1 | tee ${OUTPUT}/build-${TIMESTAMP}.log
