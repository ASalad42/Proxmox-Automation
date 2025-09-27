# Proxmox Automation

Flow = Proxmox → Cloud-Init Template → Terraform → Ansible

## Install Proxmox VE

- Download the Proxmox VE ISO
- Create a bootable USB (e.g., with Rufus) and boot PC from it.
- Install Proxmox VE.
- Access the Proxmox Web UI

## Create an Ubuntu Cloud-Init Template

- Create minimal vm with "Do not use any media", delete disk and add cloud-init drive
- Download the Ubuntu Cloud Image
  - `wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img`
- Rename and Resize the Image
  - `mv noble-server-cloudimg-amd64.img ubuntu-cloudinit.qcow2`
  - `qemu-img resize ubuntu-cloudinit.qcow2 32G`
- Import Disk into Proxmox VM
  - `qm importdisk 100 ubuntu-cloudinit.qcow2 local-lvm`
  - `qm set 100 --serial0 socket --vga serial0`
- Configure via Proxmox Web UI
  - Go to VM → Hardware.
  - Find the Unused Disk → Edit → Add and enable Discard since ssd
  - Set Boot Order → SCSI0.
  - Disable Network Boot.
- Convert VM to Template
- https://pve.proxmox.com/wiki/Cloud-Init_Support

## Deploy VM via Terraform

- Create Terraform config
- Create user and token on proxmox
- Use cloud-init template in vm config
- `terraform init`
- `terraform validate`
- `terraform plan -var-file="dev.tfvars"`
- `terraform apply -var-file="dev.tfvars"`
- `terraform destroy -var-file="dev.tfvars"`
- ssh into vm `ssh -i ~/.ssh/terra ubuntu@ip`
- `sudo apt update`
- `sudo apt install qemu-guest-agent -y`
- reboot vm and check ip in summary
- https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu

<img width="1181" height="437" alt="image" src="https://github.com/user-attachments/assets/a0017079-fc13-4651-be73-770389920aed" />
<img width="1079" height="624" alt="image" src="https://github.com/user-attachments/assets/39e3cf2c-5345-46d0-af73-23a674a828da" />


## Configure VM with Ansible

- Create an Ansible playbook (ansible/playbook.yml) to install Docker + Docker Compose on vm
- `ansible-playbook -i inventory.ini playbook.yml`
<img width="576" height="187" alt="image" src="https://github.com/user-attachments/assets/8958754f-c7bd-499e-b278-ad57ac2297d5" />
