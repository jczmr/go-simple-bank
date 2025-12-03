
migrate create -ext sql -dir db/migration -seq init_schema



migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrate -path db/migration -database "postgres://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down


migrate create -ext sql -dir db/migration -seq add_users
