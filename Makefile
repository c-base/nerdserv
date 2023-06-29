#
# Proxmox Terraform
#

.PHONY: terraform-init
terraform-init: ## Downloads the required modules
	@terraform init

.PHONY: format
format: ## Format the Terraform configuration files.
	@terraform fmt -recursive

## Help display.
## Pulls comments from beside commands and prints a nicely formatted
## display with the commands and their usage information.

.DEFAULT_GOAL := help

.PHONY: help
help: ## Prints this help
	@grep -h -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'