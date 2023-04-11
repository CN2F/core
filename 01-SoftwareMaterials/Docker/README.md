## Docker images

### Pulling Docker Images
You can find all CN2F Docker images in the [CN2F Dockerhub page](https://hub.docker.com/u/cn2f).
For pulling each image just run `docker pull` along with the image name. For example, to pull `hss` image use:
```
$ docker pull cn2f/oai-hss
```
After that, you have to `tag` the images to a proper name, which we use later in Deployment section.
```
$ docker tag cn2f/oai-hss oai-hss
```
Here's the full list of images you need and tagging them:
```
$ docker pull cassandra:2.1
$ docker pull cn2f/oai-hss
$ docker tag cn2f/oai-hss oai-hss:production
$ docker pull cn2f/magma-mme 
$ docker tag cn2f/magma-mme magma-mme:master
$ docker pull cn2f/oai-spgwc
$ docker tag cn2f/oai-spgwc oai-spgwc:production
$ docker pull cn2f/oai-spgwu-tiny
$ docker tag cn2f/oai-spgwu-tiny oai-spgwu-tiny:production
$ docker pull cn2f/oai-enb
$ docker tag cn2f/oai-enb oai-enb:latest
```

### Building Dokcer Images



