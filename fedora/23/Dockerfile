# Run an Apple Swift build on Fedora 23 with the linux_buildbot preset
# using a codebase provided in a Volume.

FROM fedora:23

MAINTAINER https://github.com/eosrei/docker-swift-dev-buildbot

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
RUN deps='git cmake ninja-build libuuid-devel icu libbsd-devel \
      libedit-devel libxml2-devel libsq3-devel swig python-devel \
      ncurses-devel pkgconfig ca-certificates python rsync file python3 \
      libicu-devel clang which tar'; \
    dnf -y update \
    && dnf -y install $deps \
    && dnf clean all \
    && rm -rf /usr/share/doc /usr/share/man \
    && git config --global user.email "root@example.com" \
    && git config --global user.name "Root" \
    && chmod +x /root/build.sh

CMD ["/root/build.sh"]
