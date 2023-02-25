#!/bin/bash -e
################################################################################
##  File:  aws.sh
##  Desc:  Installs the AWS CLI, Session Manager plugin for the AWS CLI, and AWS SAM CLI
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/os.sh
source $HELPER_SCRIPTS/install.sh

download_with_retries "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" "/tmp" "awscliv2.zip"
unzip -qq /tmp/awscliv2.zip -d /tmp
/tmp/aws/install -i /usr/local/aws-cli -b /usr/local/bin

if [[ -x "$(command -v apt)" ]]; then
    download_with_retries "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" "/tmp" "session-manager-plugin.deb"
    apt install /tmp/session-manager-plugin.deb
fi;

if [[ -x "$(command -v dnf)" ]]; then
    download_with_retries "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" "/tmp" "session-manager-plugin.rpm"
    dnf install /tmp/session-manager-plugin.deb
fi;

# Download & install the latest aws sam cli release
zipName="aws-sam-cli-linux-x86_64.zip"
zipUrl="https://github.com/aws/aws-sam-cli/releases/latest/download/${zipName}"
download_with_retries $zipUrl "/tmp" $zipName
unzip /tmp/${zipName} -d /tmp
/tmp/install

##invoke_tests "CLI.Tools" "AWS"
