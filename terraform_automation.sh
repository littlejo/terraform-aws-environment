#!/bin/bash

terraform init -input=false -plugin-dir=/usr/lib/custom-terraform-plugins
terraform plan -out=tfplan -input=false
terraform apply -input=false tfplan

