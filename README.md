## Docker container for Apple Swift development unit testing

Develop [Swift](https://swift.org/) locally on any OS while running the Ubuntu
buildbot preset in a Docker container for unit testing and builds.


### Use

First use (including cloning):
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
docker run --name swift14 -v $PWD:/src -v $PWD:/output eosrei/swift-buildbot:14.04
```

Following uses will only update changed files:
```bash
docker run --name swift14 -v $PWD:/src -v $PWD:/output
```

The build log `build-TIMESTAMP.log` and an install package *(on success)*
`swift-TIMESTAMP-ubuntu14.04.tar.gz` are written to the volume `/output`. It is
set to the same location as the project root in the examples, but you can change
it to any location.

### Todo
* Docker Machine support/details
* Ubuntu 15.10 Dockerfile
* OSX/Windows details
