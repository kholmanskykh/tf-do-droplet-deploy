init:
	terraform init

apply: init
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

reapply: destroy apply

