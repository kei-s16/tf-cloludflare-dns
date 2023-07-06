LOCK_FILE = .terraform.lock.hcl
SAVED_PLAN = tfplan

dry-run: $(LOCK_FILE)
	terraform plan -var-file="secrets.tfvars"

plan: $(LOCK_FILE)
	terraform plan -var-file="secrets.tfvars" -out tfplan

apply: $(SAVED_PLAN)
	terraform apply tfplan

all: dry-run

clean:
	rm $(SAVED_PLAN)
