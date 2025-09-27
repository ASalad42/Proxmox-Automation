pm_api_url          = "https://ip:8006/api2/json"
pm_user             = "root@pam"
pm_api_token_id     = "token-id"
pm_api_token_secret = "token-secret"

node                = "pve"
vmid                = 102
name                = "home"
clone_from_template = "ubuntu-cloudinit" # must exist on the Proxmox server before terraform apply

ci_user             = "ubuntu"
ci_password         = "changeme"

memory_mb = 4096
cores     = 1
sockets   = 1

net_bridge = "vmbr0"
net_model  = "virtio"
scsihw     = "virtio-scsi-pci"
os_type    = "cloud-init"
onboot     = true

ssh_public_key_path = "~/.ssh/terra.pub" # Terraform/Proxmox injects public key into the VM’s authorized_keys by the cloud-init mechanism
ip                  = "ip"
vm_cidr             = 24
vm_gateway          = "gw"
