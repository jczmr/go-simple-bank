
## for local creation of postgresql container in Docker Desktop

### Use a specific postgresql alpine version usually for production environment 
```sh
docker run --name simplebank -dp 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -v simplebank_postgres_data:/var/lib/postgresql/data postgres:14.19-alpine3.21
```


### Example of floating version: 
postgres:14-alpine

```sh
docker run --name simplebank -dp 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -v simplebank_postgres_data:/var/lib/postgresql/data postgres:14-alpine
```


## interact with the container from a terminal

### connect with psql to postgres database 
docker exec -it simplebank psql -U root

### connect with psql whit a specific database
docker exec -it simplebank psql -U root -d simple_bank

## Check the logs of the container
docker logs simplebank

## List all containers regardless are running or not
docker ps -a

## Stop a container
docker stop simplebank

## Start a container
docker start simplebank

## Remove a container
docker rm simplebank

## Acces it with shell
docker exec -it simplebank /bin/sh

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
docker exec -it simplebank createdb --username=root --owner=root simple_bank

docker exec -it simplebank psql -U root simple_bank
```



## Docker volumes

## Remove a volume
docker volume rm simplebank_postgres_data

## list volumes
docker volume ls