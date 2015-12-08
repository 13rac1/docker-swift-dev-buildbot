## Docker Buildbot for the Apple Swift language

Runs the [Swift](https://swift.org/) `build-script` "buildbot_linux_1404"
preset in an Ubuntu Docker container. Use for local development unit
testing or automated builds.

Source code is accessed on the host machine via a Docker Volume at `/src`. The
build log `build-${TIMESTAMP}.log` and an install package *(on success)*
`swift-${TIMESTAMP}-ubuntu${VERSION}.tar.gz` are written to the volume `/output`
after each build.

### Usage

Setup including Swift project cloning:
```bash
mkdir /path/to/swift
cd /path/to/swift
git clone https://github.com/apple/swift.git swift
git clone https://github.com/apple/swift-llvm.git llvm
git clone https://github.com/apple/swift-clang.git clang
git clone https://github.com/apple/swift-lldb.git lldb
git clone https://github.com/apple/swift-cmark.git cmark
git clone https://github.com/apple/swift-llbuild.git llbuild
git clone https://github.com/apple/swift-package-manager.git swiftpm
git clone https://github.com/apple/swift-corelibs-xctest.git
git clone https://github.com/apple/swift-corelibs-foundation.git
docker run --name swift14 -v $PWD:/src -v $PWD:/output eosrei/swift-dev-buildbot
```

Following runs will be much faster and only update changed files.
```bash
docker start -i -a swift14
```

**Note:** OS X and Windows with [Docker Machine](https://docs.docker.com/machine/)
must use volume locations within `/Users` (OS X) or `C:\Users` (Windows). Details:
* https://docs.docker.com/v1.8/installation/mac/#mount-a-volume-on-the-container
* http://docs.docker.com/engine/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume

### Links

* [Swift Github project](https://github.com/apple/swift)

### Todo
* Ubuntu 15.10 Dockerfile
