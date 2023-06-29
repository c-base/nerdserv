# nerdserv IaC

Configuration for all VMs / Containers running on nerdserv using Terraform

## Prerequisites

### Terraform

We recommend using the
[Terraform version manager](https://github.com/tfutils/tfenv) to install the
correct version of `terraform` for this project.

```bash
tfenv install
```

### Encryption Key

You will need the team’s `age` encryption key to run the encryption and
decryption steps for the Terraform state files.

## Usage

The [proxmox provider](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)
allows Terraform to provision proxmox VMs and LXC containers through proxmox's API.

### Work with the Config

1. If you have not done so, initialize Terraform by running
   `terraform init`.

2. Format the Terraform config files before committing.

   ```bash
   make format
   ```

3. Commit the changes and create a pull request, Terraform cloud should pick it
   up and create a plan.

4. Merge the pull request, everything will get applied to
