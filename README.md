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

### `age`

We use [`age`](https://github.com/FiloSottile/age) to encrypt and decrypt
Terraform state files.

Can be installed via
```bash
make install-age
```

### Encryption Key

You will need the team’s `age` encryption key to run the encryption and
decryption steps for the Terraform state files.

## Usage

The [proxmox provider](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)
allows Terraform to provision proxmox VMs and LXC containers through proxmox's API.

### Restore Terraform State

> Terraform requires [state](https://www.terraform.io/docs/state/index.html) to
> keep track of changes between runs. With the current setup we need to maintain
> three encrypted state files in the repo. This is temporary as we will
> eventually use a shared
> [remote state](https://www.terraform.io/docs/state/remote.html).

**Only necessary, if you are starting work with proxmox and Terraform on your Git
branch. If you are iterating and have the latest Terraform state, you do not
need to perform this step. **

1. **Delete any existing files ending in `*.tfstate` or `*.tfstate.backup`.**
2. **Decrypt the Terraform state file**.

   The `key` parameter is the path to the `age` keyfile the team shares for
   encryption and decryption of the state files. You should have it in your tool
   of choice for storing sensitive files and passwords, for example 1Password.

   ```bash
   make key=/path/to/key/file decrypt
   ```

   Alternatively if you put the key file with filename `"terraform-state-key"`
   into this directory you don't have to pass the `key` parameter.

These steps will put a decrypted Terraform state file in the folder.

### Provision the VMs & Containers

1. **If you have not done so, initialize Terraform and proxmox provider by running
   `terraform init`.**
2. **Review the Terraform plan.**

   Inspect the changes Terraform will apply to the VMs & Containers on proxmox.

   ```bash
   make plan
   ```

3. **Apply the plan.**

   This will apply your changes to the proxmox VMs & Containers.

   ```bash
   make apply
   ```

4. **Print configuration for debugging (optional).**

   ```bash
   terraform refresh
   terraform output
   ```

5. **Format the Terraform config files before committing.**

   ```bash
   make format
   ```

### Encrypt Terraform State

When you are done and have applied all changes to the Auth0 tenants you were
working on, you need to preserve the Terraform state by encrypting the state
file and committing the encrypted files to Git. Run the following command. The
`pubkey` parameter is the public key from the team’s `age` keyfile.

```bash
make pubkey=<age-public-key> encrypt
```

Same as in the [decryption step](#restore-terraform-state) above, if you have
the key in this directory with the correct filename you don't have to pass the
`pubkey` parameter.
