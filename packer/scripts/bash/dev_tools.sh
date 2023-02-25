#!/usr/bin/env bash

# Install Homebrew
NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
(echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /etc/profile.d/homebrew.sh;
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";

# Install rbenv
brew install rbenv ruby-build
mkdir -p "$(rbenv root)/plugins"
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/rkh/rbenv-update.git "$(rbenv root)/plugins/rbenv-update"
git clone https://github.com/linjunpop/rbenv-disk-usage.git "$(rbenv root)/plugins/disk-usage"
printf "rspec\njson\nrake\n" > "$(rbenv root)/default-gems"

# Install pyenv
brew install pyenv
mkdir -p "$(pyenv root)/plugins"
git clone https://github.com/pyenv/pyenv-doctor.git $(pyenv root)/plugins/pyenv-doctor


# Install asciidoctor
brew install asciidoctor