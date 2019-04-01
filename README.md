# Deploy ESXi+vsphere lab on libvirt

## Description

This playbook will:
- Set up a NFS datastore in `/srv/esx_lab/` on the host machine
- Deploy a local vsphere and two ESXi

A full deployment of the VCSA (VSphere) from the ISO takes =~ 25 minutes. This
is the reason why if a `vCenter-Server-Appliance` VM already exists on the
datastore, it will be used.

## Requirements

- A Linux system. Tested on Fedora 29
- Ensure nested KVM is enabled
    ```shell
    cat /etc/modprobe.d/kvm.conf
    options kvm_intel nested=1 enable_apicv=n
    options kvm ignore_msrs=1
    ```
- Install [virt-lightning](https://github.com/virt-lightning/virt-lightning)
- Download the ESXi images
    - VMware-VMvisor-Installer-6.5.0.update01-5969303.x86_64.iso
    - VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso
- Prepare the ESXi images
- Add an entry in your `/etc/hosts` for the vsphere host:
    ```shell
    192.168.123.90 vcsa photon-machine
    ```
- Download VMWare-VCSA ISO image, and keep the file in `~/Downloads`
- Ansible 2.8
- Start the `./run.sh`
