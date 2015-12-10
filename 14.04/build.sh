#!/bin/bash

export SWIFT_BUILD_ROOT=${BUILD}

TIMESTAMP=`date +"%Y%m%d-%H%M%S"`

${SOURCE}/swift/utils/build-script \
  --preset=buildbot_linux \
  install_destdir=${INSTALL} \
  installable_package=${OUTPUT}/swift-${TIMESTAMP}-ubuntu14.04.tar.gz \
  2>&1 | tee ${OUTPUT}/build-${TIMESTAMP}.log
