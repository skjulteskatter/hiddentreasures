

infra.apply:
	cd ./infra && terraform apply --var-file=vars.tfvars

infra.init:
	cd ./infra && terraform init

diff:
	./migrations/db_diff.sh $(name)

migrate.up:
	cd ./migrations && goose postgres "postgres://app@localhost:5400/app?sslmode=disable" up

migrate.down:
	cd ./migrations && goose postgres "postgres://app@localhost:5400/app?sslmode=disable" down

migrate.status:
	cd ./migrations && goose postgres "postgres://app@localhost:5400/app?sslmode=disable" status
