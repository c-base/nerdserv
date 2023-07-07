# Server Setup Information

## Scripts

### Post Install

Source: https://github.com/tteck/Proxmox/blob/d8b78777752f8727bc64b0f256b62633934741fa/misc/post-pve-install.sh

- disables Enterprise Repo
- adds no-subscription & test repos
- disables subscription nag

## Config

### Add non-free apt sources

`/etc/apt/sources.list`
```list
deb http://ftp.debian.org/debian bookworm main contrib non-free
deb http://ftp.debian.org/debian bookworm-updates main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free

# newer package versions
deb http://ftp.debian.org/debian bookworm-backports main contrib non-free

# up to date intel-microcode
deb http://ftp.debian.org/debian bookworm non-free-firmware
```

## Custom Services

### Terraform Cloud Agent

1. Create `/opt/tfc_agent/`

2. Download tfc agent from https://releases.hashicorp.com/tfc-agent/

3. Extract the zip file into `/opt/tfc_agent/` (both binaries)

4. Create env file `/opt/tfc_agent/tfc-agent.env`
    ```dotenv
    TFC_AGENT_TOKEN={insert-token-here}
    TFC_AGENT_NAME=nerdserv
    TFC_AGENT_AUTO_UPDATE=minor
    TFC_AGENT_LOG_LEVEL=info
    ```
 
5. Create systemd service `/etc/systemd/system/tfc-agent.service`
    ```service
    [Unit]
    Description=Terraform Cloud Agent
    After=network.target
    
    [Install]
    WantedBy=multi-user.target
    
    [Service]
    EnvironmentFile=/opt/tfc_agent/tfc-agent.env
    Type=simple
    ExecStart=/opt/tfc_agent/tfc-agent
    KillSignal=SIGINT
    WorkingDirectory=/opt/tfc_agent
    Restart=always
    RestartSec=5
    ```

Docs: https://developer.hashicorp.com/terraform/cloud-docs/agents
Reference: https://support.hashicorp.com/hc/en-us/articles/14383778881043-How-to-run-tfc-agent-binary-as-a-Service-with-Systemd
