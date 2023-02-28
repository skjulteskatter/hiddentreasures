

infra.apply:
	cd ./infra && terraform apply --var-file=vars.tfvars

infra.init:
	cd ./infra && terraform init