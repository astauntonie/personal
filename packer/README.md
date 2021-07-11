# Packer Templates
:source-highlighter: rouge
:rouge-style: monokai

## Intro
Packer templates for the unattended creation of Virtual Machine images. Currently the templates support VMWare, Virtualbox and QEMU for build purposes.


## Images
Currently there are templates for
+ Rocky Linux
+ Arch Linux
+ Alpine Linux

The majority of the build files expects an ISO to be found in teh iso sub-directory, although some have been created with a URL instead.

### Rocky
Currently there are builds for the following install types
|====
|Name|Version|Type|Install|Information
|rocky8_4.json|8.4|local|Minimal|This expects the Rocky 8.4 Minimal ISO and installs from packages on the ISO
|rocky8_4_online.json|8.4|online|Minimal|This expects the Rocky 8.4 Minimal ISO and installs from packages on Web
|rocky8_4_dvd.json|8.4|local|Minimal|This expects the Rocky 8.4 DVD ISO and installs from packages on the ISO
|====

## Usage
packer build --only=<builder> os/<type>/<build script>

e.g
[source, shell]
----
packer build --only=virtualbox os/rocky/rocky8_4_dvd.json
packer build --only=virtualbox os/qemu/rocky8_4.json
----

Please note that you must have the application (VMWare, Virtualbox, QEMU) installed in order to use it to build machine images.
