#!/bin/bash

# Workarounds for Fedora/Redhat/Centos

# Symlinks ninja -> ninja-build for https://bugzilla.redhat.com/show_bug.cgi?id=1166135
ln -s /usr/bin/ninja-build /usr/bin/ninja

# Symlinks lib64/python2.7 -> lib/python for:
# * https://bugs.swift.org/browse/SR-100
# * https://llvm.org/bugs/show_bug.cgi?id=18957
# * https://llvm.org/bugs/show_bug.cgi?id=23785
mkdir -p /build/buildbot_linux/lldb-linux-x86_64/lib
mkdir -p /build/buildbot_linux/lldb-linux-x86_64/lib64/python2.7
ln -s /build/buildbot_linux/lldb-linux-x86_64/lib64/python2.7 /build/buildbot_linux/lldb-linux-x86_64/lib/python2.7

export SWIFT_BUILD_ROOT=${BUILD}

TIMESTAMP=`date +"%Y%m%d-%H%M%S"`

${SOURCE}/swift/utils/build-script \
  --preset=buildbot_linux \
  install_destdir=${INSTALL} \
  installable_package=${OUTPUT}/swift-${TIMESTAMP}-fedora23.tar.gz \
  2>&1 | tee ${OUTPUT}/build-${TIMESTAMP}.log
