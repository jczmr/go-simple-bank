
## for local creation of postgresql container in Docker Desktop

### Use a specific postgresql alpine version usually for production environment 
```sh
docker run --name simplebank_postgres -dp 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -v simplebank_postgres_data:/var/lib/postgresql/data postgres:14.19-alpine3.21
```


### Example of floating version: 
postgres:14-alpine

```sh
docker run --name simplebank_postgres -dp 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -v simplebank_postgres_data:/var/lib/postgresql/data postgres:14-alpine
```


## interact with the container from a terminal

### connect with psql to postgres database 
docker exec -it simplebank_postgres psql -U root

### connect with psql whit a specific database
docker exec -it simplebank_postgres psql -U root -d simple_bank

## Check the logs of the container
docker logs simplebank_postgres

## List all containers regardless are running or not
docker ps -a

## Stop a container
docker stop simplebank_postgres

## Start a container
docker start simplebank_postgres

## Remove a container
docker rm simplebank_postgres

## Acces it with shell
docker exec -it simplebank_postgres /bin/sh

## Exit from the container shell
exit 

## in shell of a postrgres container we can use specific command for the database


### create a database and use psql to interact with it
### select actual date, then exit from database with \q
```sh
createdb --username=root --owner=root simple_bank

psql simple_bank

select now();

\q
```

## delete a database
```sh
dropdb simple_bank
```


## From outside the container we can use Docker CLI to directly create and access to a database

```sh
docker exec -it simplebank_postgres createdb --username=root --owner=root simple_bank

docker exec -it simplebank_postgres psql -U root simple_bank
```



## Docker volumes

## Remove a volume
docker volume rm simplebank_postgres_data

## list volumes
docker volume ls


# Build images
docker build -t simplebank:0.3 .

## Run a version of the previously created image of simplebank app
docker run --name simplebank -p 8080:8080 simplebank:0.3

### Add the environment GIN_MODE=release instead of GIN_MODE=debug for Gin Framework
docker run --name simplebank -p 8080:8080 -e GIN_MODE=release simplebank:0.3


## inspect settings of a container 
docker container inspect simplebank_postgres


### Add the environment DB_SOURCE to overwrite it with the value of IP of the actual running postgresSql container
### e.g replacing localhost with 172.17.0.3 (the actual IP of the running postgreSql container)
docker run --name simplebank -p 8080:8080 -e GIN_MODE=release -e DB_SOURCE="postgresql://root:secret@172.17.0.3:5432/simple_bank?sslmode=disable" simplebank:0.3


# NETWORKS

## list networks
docker network ls

## inspect details
docker network inspect network_name


## use help
docker network --help

## create a custom network 
docker network create bank-network

## use help for a specific command
docker network connect --help

## connect
Usage:  docker network connect [OPTIONS] NETWORK CONTAINER

docker network connect bank-network simplebank_postgres


## contect simplebank container using the option networw to use the new custome network bank_network
docker run --name simplebank --network bank-network -p 8080:8080 -e GIN_MODE=release -e DB_SOURCE="postgresql://root:secret@simplebank_postgres:5432/simple_bank?sslmode=disable" simplebank:0.3