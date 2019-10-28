# Deploy ESXi+vsphere lab on libvirt

## Description

This playbook will deploy:

- a local vsphere (in an ESXi)
- two ESXi
- a datastore VM (with a NFS)

A full deployment of the VCSA (VSphere) from the ISO takes =~ 25 minutes.

## Requirements

- A Linux system. Tested on Fedora 30 and Ubuntu 18.04.
- Virt-Lightning (https://virt-lightning.org/) and libvirt
- ESXi QCOW2 image (https://github.com/virt-lightning/esxi-cloud-images)
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
- Download VMWare-VCSA ISO image and copy it in `~/Downloads/VMware-VCSA-all-6.7.0-14367737.iso`
- Run `run.sh`. The full run takes around 1h, the VCSA (vcenter) deployment itself takes =~ 45m.

### Outs

By default, the scrip will prepare 3 ESXi VM, it will also deploy a VCSA (vcenter) host in a nested VM on `esxi-vcenter`.

- esxi-vcenter
    - Memory: 12000MB
    - CPU: 2
    - Disk: 40GiB
- esxi1
    - Memory: 4096MB
    - CPU: 1
    - Disk: 10GiB
- esxi2
    - Memory: 4096MB
    - CPU: 1
    - Disk: 10GiB10
- vcenter
    - IP: 192.168.123.90

## Warning

The playbook will modify your `/etc/hosts` to add the esxi and vcsa hosts.
