# Test an Apple Swift build with the Ubuntu 15.10 buildbot preset using a
# codebase provided by the user.

FROM ubuntu:15.10
MAINTAINER Brad Erickson <eosrei@gmail.com>

# Volume mounted from host to access source code. [Required]
VOLUME ["/src"]
# Volume to store compiled package and build log. [Optional]
VOLUME ["/output"]

ENV SOURCE /src
ENV BUILD /build
ENV INSTALL /install
ENV OUTPUT /output

COPY build.sh /root/build.sh

# Note: git config required for swiftpm/Tests/dep/FunctionalBuildTests.swift
RUN buildDeps='git cmake ninja-build uuid-dev icu-devtools libbsd-dev \
      libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev \
      libncurses5-dev pkg-config ca-certificates python rsync file'; \
      runDeps='libicu-dev clang'; \
    apt-get update \
    && apt-get -y install $buildDeps $runDeps --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && git config --global user.email "root@example.com" \
    && git config --global user.name "Root" \
    && chmod +x /root/build.sh

CMD ["/root/build.sh"]
