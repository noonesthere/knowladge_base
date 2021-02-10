create docker file Dockerfile
###### Build docker 
```
docker build -t getting-started .
```
###### Run docker image with forwarded port
```
docker run -p 3000:3000 getting-started
```

###### List dockers containers 
```
docker ps [-a]
```
###### Stop container
```
docker stop container-id [container name]
```
###### Remove container
```
docker rm : (docker rm -f )
```
###### List docker images
```
docker images
```
###### Remove docker image
```
docker rmi -f docker-image
```

