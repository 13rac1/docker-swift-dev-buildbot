# Build a current Apple Swift snapshot using the buildbot preset
# Installs to /usr/local/
# Install package at ${package}

FROM ubuntu:14.04
MAINTAINER Brad Erickson <eosrei@gmail.com>

ENV build /usr/src/swift
ENV install ${build}/output
ENV package /swift-ubuntu14.04.tar.gz

WORKDIR ${build}

# Note: git config required for swiftpm/Tests/dep/FunctionalBuildTests.swift
RUN buildDeps='git cmake ninja-build uuid-dev icu-devtools libbsd-dev \
      libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev \
      libncurses5-dev pkg-config ca-certificates python rsync'; \
      runDeps='libicu-dev clang-3.6'; \
    apt-get update \
    && apt-get -y install $buildDeps $runDeps --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100 \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100 \
    && git config --global user.email "root@example.com" \
    && git config --global user.name "Root" \
    && git clone --depth 1 https://github.com/apple/swift.git swift \
    && git clone --depth 1 https://github.com/apple/swift-llvm.git llvm \
    && git clone --depth 1 https://github.com/apple/swift-clang.git clang \
    && git clone --depth 1 https://github.com/apple/swift-lldb.git lldb \
    && git clone --depth 1 https://github.com/apple/swift-cmark.git cmark \
    && git clone --depth 1 https://github.com/apple/swift-llbuild.git llbuild \
    && git clone --depth 1 https://github.com/apple/swift-package-manager.git swiftpm \
    && git clone --depth 1 https://github.com/apple/swift-corelibs-xctest.git \
    && git clone --depth 1 https://github.com/apple/swift-corelibs-foundation.git \
    && ${build}/swift/utils/build-script --preset=buildbot_linux_1404 \
      install_destdir=${install} installable_package=${package} \
      2>&1 | tee /build.log \
    && cp ${install}/usr/* /usr/local/ -R \
    && rm -rf ${build} \
    && apt-get purge -y --auto-remove $buildDeps

RUN swift --version

ENTRYPOINT ["swift"]
CMD ["--help"]
