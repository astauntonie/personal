#!/bin/sh -eux
# determine the major EL version we're runninng
major_version="`sed 's/^.\+ release \([.0-9]\+\).*/\1/' /etc/redhat-release | awk -F. '{print $1}'`";

# Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/rhel/${major_version}/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

# make sure we use dnf on EL 8+
if [ "$major_version" -ge 8 ]; then
  YUMUP=dnf
else
  YUMUP=yum
fi

$YUMUP install -y powershell azure-cli jq

# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
# https://www.suse.com/support/kb/doc/?id=000016692
echo 'vm.max_map_count=262144' | tee -a /etc/sysctl.conf

# https://kind.sigs.k8s.io/docs/user/known-issues/#pod-errors-due-to-too-many-open-files
echo 'fs.inotify.max_user_watches=655360' | tee -a /etc/sysctl.conf
echo 'fs.inotify.max_user_instances=1280' | tee -a /etc/sysctl.conf