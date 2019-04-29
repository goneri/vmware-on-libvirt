# Deploy ESXi+vsphere lab on libvirt

## Description

This playbook will:
- Set up a NFS datastore in `/srv/esx_lab/` on the host machine
- Deploy a local vsphere and two ESXi

A full deployment of the VCSA (VSphere) from the ISO takes =~ 25 minutes. This
is the reason why if a `vCenter-Server-Appliance` VM already exists on the
datastore, it will be used.

## Requirements

- Ansible 2.8
- A Linux system. Tested on Fedora 29
- Ensure nested KVM is enabled
    ```shell
    cat /etc/modprobe.d/kvm.conf
    options kvm_intel nested=1 enable_apicv=n
    options kvm ignore_msrs=1
    ```
- Install [virt-lightning](https://github.com/virt-lightning/virt-lightning)
- Build your images:
    - Follow the procedure described in https://github.com/virt-lightning/esxi-cloud-images
    - copy the .qcow2 files in `/var/lib/virt-lightning/pool/upstream/`
- VMWare-VCSA ISO image
- Ansible 2.8

## Usage

- Keep the VMWare-CSA ISO file in `~/Downloads` or change the parameter in `roles/vsphere-lab/defaults/main.yaml`
- Start the `./run.sh`
