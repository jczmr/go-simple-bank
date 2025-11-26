postgres:
	docker run --name simplebank_postgres --network bank-network -dp 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -v simplebank_postgres_data:/var/lib/postgresql/data postgres:14.19-alpine3.21

createdb:
	docker exec -it simplebank_postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it simplebank_postgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

# Define the list of packages to include for coverage
COVER_PKGS := ./api/...,./token/...,./util/...,./db/sqlc/...

cover:
	@echo "Running tests and generating coverage report..."
	go test -coverpkg=$(COVER_PKGS) ./... -coverprofile cover.out
	go tool cover -html=cover.out -o coverage.html
	wslview coverage.html

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/jczmr/go-simple-bank/db/sqlc Store
	
.PHONY: postgres createdb dropdb migrateup migratedown migrateup1 migratedown1 sqlc test cover server mock