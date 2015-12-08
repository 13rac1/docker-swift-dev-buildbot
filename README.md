## Docker container for Apple Swift development unit testing

Develop locally on any OS and run the Ubuntu buildbot preset in a Docker
container for unit testing and builds.


### Use

On native Linux:
```
user@machine /path/to/swift/project $ docker run --name swift-tests14
-v $PWD:/src -v $PWD:/output eosrei/swift-buildbot:14.04
```



### Todo
* Docker Machine support/details
* Ubuntu 15.10 Dockerfile
* OSX/Windows details
