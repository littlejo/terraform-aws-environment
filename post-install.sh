#!/bin/bash

cp /etc/skel/.bashrc /root/
terraform -install-autocomplete
terraform_0.13 -install-autocomplete
bash
