### Delete Containers ###
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

### Delete Images ###
docker rmi -f $(docker images -q)

### Delete Volumes ###
docker volume rm $(docker volume ls -q)

### Delete Network ###
docker network prune