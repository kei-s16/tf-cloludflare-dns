TFC_CREDENTIALS = $(HOME)/.terraform.d/credentials.tfrc.json

plan: $(TFC_CREDENTIALS)
	terraform plan

apply: $(TFC_CREDENTIALS)
	terraform apply
