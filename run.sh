#!/bin/bash
rm vcsa.log
rm inventory
touch inventory
ansible-playbook deploy.yaml -i inventory
