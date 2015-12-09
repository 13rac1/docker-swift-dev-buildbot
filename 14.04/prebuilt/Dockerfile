# Run an Apple Swift build with the Ubuntu 14.04 buildbot preset using a
# using a codebase provided in a Volume.
# NOTE: This container is bre-built with a full ${BUILD} directory to save build
# time on initial builds.

# Todo: Custom build preset to avoid running tests?

FROM eosrei/swift-dev-buildbot:14.04

# Store the source in the temporary volume
WORKDIR ${BUILD}

RUN git clone --depth 1 https://github.com/apple/swift.git swift \
    && git clone --depth 1 https://github.com/apple/swift-llvm.git llvm \
    && git clone --depth 1 https://github.com/apple/swift-clang.git clang \
    && git clone --depth 1 https://github.com/apple/swift-lldb.git lldb \
    && git clone --depth 1 https://github.com/apple/swift-cmark.git cmark \
    && git clone --depth 1 https://github.com/apple/swift-llbuild.git llbuild \
    && git clone --depth 1 https://github.com/apple/swift-package-manager.git swiftpm \
    && git clone --depth 1 https://github.com/apple/swift-corelibs-xctest.git \
    && git clone --depth 1 https://github.com/apple/swift-corelibs-foundation.git \
    && export SWIFT_BUILD_ROOT=${BUILD} \
    && export TIMESTAMP=`date +"%Y%m%d-%H%M%S"` \
    && ${BUILD}/swift/utils/build-script --preset=buildbot_linux_1404 \
       install_destdir=${INSTALL} \
       installable_package=${OUTPUT}/swift-${TIMESTAMP}-ubuntu14.04.tar.gz \
       2>&1 | tee ${OUTPUT}/build-${TIMESTAMP}.log \
    && rm -rf ${BUILD}/* ${OUTPUT}/*

CMD ["/root/build.sh"]
