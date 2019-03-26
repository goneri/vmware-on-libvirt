# Deploy ESXi+vsphere lab on libvirt

## Requirements

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
- Start the `./run.sh`
