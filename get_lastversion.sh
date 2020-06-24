#!/bin/bash

url=https://releases.hashicorp.com/terraform

version13=$(curl $url/ 2> /dev/null | grep 0.13 | head -1 | awk -F/ '{print $3}')
version12=$(curl $url/ 2> /dev/null | grep 0.12 | head -1 | awk -F/ '{print $3}')

url_arg=$url/$version12/terraform_${version12}_linux_amd64.zip

curl $url_arg -o "/tmp/terraform.zip"
unzip /tmp/terraform.zip -d /usr/local/bin
rm /tmp/terraform.zip

url_arg=$url/$version13/terraform_${version13}_linux_amd64.zip

curl $url_arg -o "/tmp/terraform.zip"
unzip /tmp/terraform.zip -d /tmp/
mv /tmp/terraform /usr/local/bin/terraform_0.13
rm /tmp/terraform.zip
