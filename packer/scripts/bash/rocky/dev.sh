#!/usr/bin/env bash

export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash;

wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.5%2B8/OpenJDK17U-jdk_x64_linux_hotspot_17.0.5_8.tar.gz -O /home/vagrant/openjdk17.tar.gz
pushd /opt > /dev/null;
tar xzf /home/vagrant/openjdk17.tar.gz && mv jdk-17.0.5+8 /opt/jdk17 && rm -rf jdk-17.0.5+8;
popd > /dev/null;


printf "export JAVA_HOME=/opt/jdk17;\n" > /etc/profile.d/jdk.sh
printf "echo \$PATH | grep -i \$(echo \$JAVA_HOME) > /dev/null;\n" >> /etc/profile.d/jdk.sh
printf "if [[ \$? -ne 0 ]]; then\n\texport PATH=\$JAVA_HOME/bin:\$PATH;\nfi;" >> /etc/profile.d/jdk.sh

if [[ -f /etc/mate_installed ]]; then
mkdir -m 755 -p /opt/dev;
# IntelliJ
wget https://download.jetbrains.com/idea/ideaIC-2022.3.1.tar.gz -O /home/vagrant/intellij.tar.gz
pushd /opt/dev > /dev/null;
tar xzf /home/vagrant/intellij.tar.gz
popd > /dev/null;

# Spring Tools 4
wget https://download.springsource.com/release/STS4/4.17.1.RELEASE/dist/e4.26/spring-tool-suite-4-4.17.1.RELEASE-e4.26.0-linux.gtk.x86_64.tar.gz -O /home/vagrant/sts4.tar.gz
pushd /opt/dev > /dev/null;
tar xzf /home/vagrant/sts4.tar.gz
popd > /dev/null;

chmod 755 -R /opt/dev;
printf "echo \$PATH | grep -i  sts > /dev/null;\n" >> /etc/profile.d/dev_ide.sh
printf "if [[ \$? -ne 0 ]]; then\n\texport PATH=/opt/dev/sts-4.17.1.RELEASE:\$PATH;\nfi;" >> /etc/profile.d/dev_ide.sh
printf "echo \$PATH | grep -i  idea > /dev/null;\n" >> /etc/profile.d/dev_ide.sh
printf "if [[ \$? -ne 0 ]]; then\n\texport PATH=/opt/dev/idea-IC-223.8214.52/bin:\$PATH;\nfi;" >> /etc/profile.d/dev_ide.sh

# Add Desktop Icons
## IntelliJ
printf "[Desktop Entry]\nVersion=1.0\nType=Application\nName=IntelliJ IDEA\nIcon=/opt/test/idea-IC-223.8214.52/bin/idea.svg\n" >> /usr/share/applications/jetbrains-idea.desktop
printf "Exec=\"/opt/test/idea-IC-223.8214.52/bin/idea.sh\" %f\nComment=Capable and Ergonomic IDE for JVM\n" >> /usr/share/applications/jetbrains-idea.desktop
printf "Categories=Development;IDE;\nTerminal=false\nStartupWMClass=jetbrains-idea\n" >> /usr/share/applications/jetbrains-idea.desktop

## Spring Tools 4
printf "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Spring Tools 4\nIcon=/opt/test/sts-4.17.1.RELEASE/icon.xpm\n" >> /usr/share/applications/sts4.desktop
printf "Exec=\"/opt/test/sts-4.17.1.RELEASE/SpringToolSuite4\"\nComment=Capable and Ergonomic IDE for JVM\n" >> /usr/share/applications/sts4.desktop
printf "Categories=Development;IDE;\nTerminal=false\n" >> /usr/share/applications/sts4.desktop

chmod 755 /usr/share/applications/sts4.desktop
chmod 755 /usr/share/applications/jetbrains-idea.desktop
fi;