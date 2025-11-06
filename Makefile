postgres:
	docker run --name simplebank -dp 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -v simplebank_postgres_data:/var/lib/postgresql/data postgres:14.19-alpine3.21

createdb:
	docker exec -it simplebank createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it simplebank dropdb simple_bank

migrateup:
	migrate -path db/migrations -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrations -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate
	
.PHONY: postgres createdb dropdb migrateup migratedown sqlc