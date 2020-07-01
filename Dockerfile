FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y openssh-client curl vim bash-completion git jq unzip awscli

ADD get_lastversion.sh /var/tmp
RUN bash /var/tmp/get_lastversion.sh

ADD aws.tf /var/tmp
WORKDIR /var/tmp
RUN mkdir -p /usr/lib/custom-terraform-plugins && \
    terraform init && \
    find .terraform/ -name "*aws*" | xargs -i cp {} /usr/lib/custom-terraform-plugins && \
    rm -rf .terraform

ADD post-install.sh /var/tmp
RUN chmod a+x /var/tmp/post-install.sh

#./launch-instance.sh AKIAVZZ64MGKZVQBLX5D wDzLxH4woSoHGOP0faqGirnjwxOU7/oYrR4xRls5
