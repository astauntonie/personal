#!/usr/bin/env bash

major_version="`sed 's/^.\+ release \([.0-9]\+\).*/\1/' /etc/redhat-release | awk -F. '{print $1}'`";

dnf update -y;
dnf -y install epel-release;
dnf install -y git wget curl nmap procps-ng;

rpm --import https://repo.saltproject.io/salt/py3/redhat/${major_version}/x86_64/latest/SALTSTACK-GPG-KEY2.pub
curl -fsSL https://repo.saltproject.io/salt/py3/redhat/${major_version}/x86_64/latest.repo | sudo tee /etc/yum.repos.d/salt.repo

dnf clean expire-cache
dnf install -y salt-minion salt-ssh

printf "file_client: local\n" >> /etc/salt/minion


systemctl enable salt-minion && systemctl start salt-minion


firewall-cmd --permanent --add-port={4505,4506}/tcp
firewall-cmd --reload

dnf groupinstall -y 'Development Tools';

mv /tmp/devtools.sh && chmod +x /opt/devtools.sh

# Install sdkman
export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash;
