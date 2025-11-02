
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
docker exec -it simplebank psql -U root

## Check the logs of the container
docker logs simplebank

