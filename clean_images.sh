# docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
# docker container prune
docker volume rm $(docker volume ls -qf dangling=true)
docker image prune -a


