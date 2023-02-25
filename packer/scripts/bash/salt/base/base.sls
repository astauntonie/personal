install base packages:
  pkg.latest:
    - pkgs:
      {% if grains['os'] in [ 'RedHat', 'CentOS'] %}
      - gcc
      - gcc-c++
      - bzip2
      - make
      - zlib-devel
      - openssl-devel
      - readline-devel
      - perl
      - wget
      - dkms
      - kernel-devel
      {% endif %}
