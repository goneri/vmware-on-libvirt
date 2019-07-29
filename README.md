# Deploy ESXi+vsphere lab on libvirt

## Description

This playbook will:
- Set up a NFS datastore in `/srv/esx_lab/` on the host machine
- Deploy a local vsphere and two ESXi

A full deployment of the VCSA (VSphere) from the ISO takes =~ 25 minutes. This
is the reason why if a `vCenter-Server-Appliance` VM already exists on the
datastore, it will be used.

## Requirements

- A Linux system. Tested on Fedora 29 and 30.
- Libvirt and virt-install.
- ESXi ISO image
- Ansible 2.8

## First deployment

- Ensure nested KVM is enabled
    ```shell
    cat /etc/modprobe.d/kvm.conf
    options kvm_intel nested=1 enable_apicv=n
    options kvm ignore_msrs=1
    ```
- Install the roles:
    `ansible-galaxy install -r requirements.yml -p roles`
- Download VMWare-VCSA ISO image and copy it in `isos/VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso`
- Run `run.sh`. The full run takes around 1h, the VCSA (vcenter) deployment itself takes =~ 45m.

### Outs

By default, the scrip will prepare 3 ESXi VM, it will also deploy a VCSA (vcenter) host in a nested VM on `esxi-vcenter`.

- esxi-vcenter
    - IP: 192.168.122.80
    - Memory: 14096MB
    - CPU: 2
    - Disk: 40GiB
- esxi1
    - IP: 192.168.122.81
    - Memory: 4096MB
    - CPU: 1
    - Disk: 10GiB
- esxi2
    - IP: 192.168.122.82
    - Memory: 4096MB
    - CPU: 1
    - Disk: 10GiB10
- vcsa
    - IP: 192.168.122.90

## Warning

The playbook will modify your `/etc/hosts` to add the esxi and vcsa hosts.
