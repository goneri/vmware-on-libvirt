#!/bin/bash
rm inventory
vl up
vl ansible_inventory > inventory
ansible-playbook playbook.yml -i inventory
