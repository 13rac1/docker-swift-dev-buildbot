# Test an Apple Swift build with the Ubuntu 14.04 buildbot preset using a
# codebase provided by the user.

FROM ubuntu:14.04
MAINTAINER Brad Erickson <eosrei@gmail.com>

# Volume mounted from host to access source code. [Required]
VOLUME ["/src"]
# Volume to store compiled package and build log. [Optional]
VOLUME ["/output"]

ENV SOURCE /src
ENV BUILD /build
ENV INSTALL /install
ENV OUTPUT /output

COPY start.sh /root/start.sh

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
    && git config --global user.name "Root"
    && COPY start.sh /root/start.sh

CMD ["/root/start.sh"]
