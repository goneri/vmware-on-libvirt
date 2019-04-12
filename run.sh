#!/bin/bash
vl up
vl ansible_inventory > ~/vshpere_lab.inventory
ansible-playbook playbook.yml -i ~/vshpere_lab.inventory
