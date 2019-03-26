#!/bin/bash
rm vcsa.log
rm inventory
vl up
vl ansible_inventory > inventory
ansible-playbook deploy.yaml -i inventory
