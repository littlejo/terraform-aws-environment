FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y openssh-client curl python3-pip vim bash-completion git jq nodejs unzip

RUN pip3 install awscli

ADD get_lastversion.sh /var/tmp

RUN bash /var/tmp/get_lastversion.sh

ADD post-install.sh /var/tmp
RUN chmod a+x /var/tmp/post-install.sh

#./launch-instance.sh AKIAVZZ64MGKZVQBLX5D wDzLxH4woSoHGOP0faqGirnjwxOU7/oYrR4xRls5
