#!/bin/bash -e
################################################################################
##  File:  basic.sh
##  Desc:  Installs basic command line utilities and dev packages
################################################################################
source $HELPER_SCRIPTS/install.sh

if [[ -x "$(command -v dpkg)" ]]; then
    common_packages=$(get_toolset_value .apt.common_packages[])
    cmd_packages=$(get_toolset_value .apt.cmd_packages[])
fi;

if [[ -x "$(command -v rpm)" ]]; then
    common_packages=$(get_toolset_value .rpm.common_packages[])
    cmd_packages=$(get_toolset_value .rpm.cmd_packages[])
fi;

for package in $common_packages $cmd_packages; do
    echo "Install $package"

    if [[ -x "$(command -v apt-get)" ]]; then
        apt-get install -y --no-install-recommends $package
    fi;

    if [[ -x "$(command -v dnf)" ]]; then
        dnf install -y $package
    fi;

     if [[ -x "$(command -v yum)" ]]; then
        yum install -y $package
    fi;
done

#invoke_tests "Apt"