#
# Proxmox Terraform
#

ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
BIN_DIR := "${ROOT_DIR}/.bin"
OS := $(shell uname -s)
export PATH := .bin:$(PATH)

.PHONY: plan
plan: ## Generate Terraform execution plan for Auth0.
	@echo "##################################################"
	@echo "# Generating Terraform execution plan for Auth0. #"
	@echo "##################################################"
	@terraform plan -out tf.plan

.PHONY: apply
apply: ## Run terraform plan for Auth0.
	@echo "################################################"
	@echo "# Applying Terraform execution plan for Auth0. #"
	@echo "################################################"
	@terraform apply tf.plan

# Try to find the key locally
ifndef key
ifeq (,$(wildcard "${ROOT_DIR}/terraform-state-key"))
 key := ./terraform-state-key
endif
endif

.PHONY: decrypt
decrypt: ensure-age ## Decrypt all files with a given key
ifdef key
	@PATH="${BIN_DIR}:${PATH}"
	age --decrypt -i "${key}" -o "terraform.tfstate" "terraform.tfstate.encrypted";
	age --decrypt -i "${key}" -o "terraform.tfvars" "terraform.tfvars.encrypted";
else
	@echo "Missing key. Usage: \`make decrypt key=<path-to-keyfile>\`"
endif

.PHONY: encrypt
encrypt: ensure-age ## Encrypt all files with a given key
ifdef key
	@PATH="${BIN_DIR}:${PATH}"
	age --encrypt -i "${key}" -o "terraform.tfstate.encrypted" "terraform.tfstate";
	age --encrypt -i "${key}" -o "terraform.tfvars.encrypted" "terraform.tfvars";
else
	@echo "Missing key. Usage: \`make encrypt key=<path-to-keyfile>\`"
endif


.PHONY: terraform-init
terraform-init: ## Downloads the required modules
	@terraform init

.PHONY: format
format: ## Format the Terraform configuration files.
	@terraform fmt -recursive

#
# Tools
#

AGE_VERSION := v1.1.1
OS := $(shell uname -s)
ARCH := $(shell uname -m)
AGE_BIN := age
ifeq ($(OS), Linux)
	ifeq ($(ARCH), arm64)
		AGE_ARCHIVE := age-$(AGE_VERSION)-linux-arm64.tar.gz
	else
		AGE_ARCHIVE := age-$(AGE_VERSION)-linux-amd64.tar.gz
	endif
endif
ifeq ($(OS), Darwin) # macos
	ifeq ($(ARCH), arm64)
		AGE_ARCHIVE := age-$(AGE_VERSION)-darwin-arm64.tar.gz
	else
		AGE_ARCHIVE := age-$(AGE_VERSION)-darwin-amd64.tar.gz
	endif
endif
ifeq ($(OS), $(filter $(OS), Windows_NT CYGWIN_NT-10.0))
	AGE_ARCHIVE := age-$(AGE_VERSION)-windows-amd64.zip
	AGE_BIN := age.exe
endif

.PHONY: ensure-age
ensure-age: ## checks the correct version of the age cli is installed
	@PATH="${BIN_DIR}:${PATH}"
	@age --version | grep ${AGE_VERSION} > /dev/null

.PHONY: install-age
install-age: ## install specified version of age cli
	@mkdir -p "${BIN_DIR}"
	@echo "downloading $(AGE_ARCHIVE)"
	@curl -sOL https://github.com/FiloSottile/age/releases/download/$(AGE_VERSION)/$(AGE_ARCHIVE)
	@echo "extracting $(AGE_ARCHIVE)"
ifeq ($(suffix $(AGE_ARCHIVE)), zip)
	@unzip -o -j $(AGE_ARCHIVE) -d "${BIN_DIR}" "age/${AGE_BIN}"
else
	@tar -xzf "$(AGE_ARCHIVE)" --directory "${BIN_DIR}" --strip-components=1 "age/${AGE_BIN}" "age/age-keygen"
endif
	@rm -f $(AGE_ARCHIVE)

## Help display.
## Pulls comments from beside commands and prints a nicely formatted
## display with the commands and their usage information.

.DEFAULT_GOAL := help

.PHONY: help
help: ## Prints this help
	@grep -h -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'