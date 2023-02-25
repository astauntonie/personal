mkdir -p /opt/space-on-premises && pushd space-on-premises > /dev/null;
export SPACE_RELEASE_NAME="2023.1.0";
curl -O "https://assets.on-premises.service.jetbrains.space/${SPACE_RELEASE_NAME}/docker-compose.yml";

dnf check-update;
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;
dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin;

systemctl enable docker;
systemctl start docker;
sudo usermod -aG docker vagrant;

