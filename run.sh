#!/bin/bash
rm -f /tmp/vcsa.log
vl up
vl ansible_inventory> vshpere_lab.inventory
ansible-playbook playbook.yml -vvvvv -i vshpere_lab.inventory
