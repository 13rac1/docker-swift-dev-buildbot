### Docker Buildbot for the Apple Swift language

Runs the [Swift](https://swift.org/) *buildbot_linux* build preset in Ubuntu 14.04/15.10 and Fedora 23 containers. Use for local development unit testing or automated builds.

Source code is accessed on the host machine via a Docker Volume at `/src`. The build log `build-${TIMESTAMP}.log` and an install package *(on success)* `swift-${TIMESTAMP}-ubuntu${VERSION}.tar.gz` are written to the Volume `/output` after each build.

Pre-built containers available on Docker Hub at: https://hub.docker.com/r/eosrei/swift-dev-buildbot/

### Dockerfiles and Tags

* Ubuntu 14.04 LTS: `latest`,`14.04` ([Dockerfile](https://github.com/eosrei/docker-swift-dev-buildbot/blob/master/14.04/Dockerfile))
* Ubuntu 15.10: `15.10` ([Dockerfile](https://github.com/eosrei/docker-swift-dev-buildbot/blob/master/15.10/Dockerfile))
* Fedora 23: `fedora23` ([Dockerfile](https://github.com/eosrei/docker-swift-dev-buildbot/blob/master/fedora/23/Dockerfile))

### Setup

This process requires a copy of the Swift project codebase to share with the containers. The source can be a location on the host machine or as a linked Volume in another container. The examples assume local development.

Example Swift project cloning, further details at the [Swift Github project](https://github.com/apple/swift) page:
```
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
```

Get the container images and the builds:
```
cd /path/to/swift
docker run --name swift-14 -v $PWD:/src -v $PWD:/output eosrei/swift-dev-buildbot:14.04
docker run --name swift-15 -v $PWD:/src -v $PWD:/output eosrei/swift-dev-buildbot:15.10
docker run --name swift-f23 -v $PWD:/src -v $PWD:/output eosrei/swift-dev-buildbot:fedora23
```

**Note:** OS X and Windows with [Docker Machine](https://docs.docker.com/machine/) must use volume locations within `/Users` (OS X) or `C:\Users` (Windows). Details:
* https://docs.docker.com/v1.8/installation/mac/#mount-a-volume-on-the-container
* http://docs.docker.com/engine/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume

### Usage

Subsequent builds will reuse build artifacts and run quickly; ~1.5hrs vs
~20 minutes in my experience.

Run the Ubuntu 14.04 LTS build:
```
docker start -i -a swift-14
```

Run the Ubuntu 15.10 build:
```
docker start -i -a swift-15
```

Run the Fedora 23 build:
```
docker start -i -a swift-f23
```

### Example Results

```bash
user@server ~/development/swift $ ls -l
total 265616
-rw-r--r--  1 root root   123608 Dec  8 10:31 build-20151208-180542.log
-rw-r--r--  1 root root   799965 Dec  8 14:48 build-20151208-211212.log
drwxr-xr-x 16 user user     4096 Dec  7 16:52 clang
drwxr-xr-x 11 user user     4096 Dec  7 16:53 cmark
drwxr-xr-x 15 user user     4096 Dec  7 16:54 llbuild
drwxr-xr-x 21 user user     4096 Dec  7 20:19 lldb
drwxr-xr-x 16 user user     4096 Dec  7 16:51 llvm
drwxr-xr-x 16 user user     4096 Dec  8 10:05 swift
-rw-r--r--  1 root root 89858509 Dec  8 10:31 swift-20151208-180542-ubuntu14.04.tar.gz
-rw-r--r--  1 root root 89345813 Dec  8 14:48 swift-20151208-211212-ubuntu15.10.tar.gz
drwxr-xr-x 14 user user     4096 Dec  8 12:40 swift-corelibs-foundation
drwxr-xr-x  5 user user     4096 Dec  7 16:54 swift-corelibs-xctest
drwxr-xr-x  8 user user     4096 Dec  7 16:54 swiftpm
```
