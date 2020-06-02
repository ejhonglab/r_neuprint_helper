#!/usr/bin/env bash

set -e

sudo apt update
# TODO evaluate at end whether r-base-dev is actually required
# TODO need to install them after adding the stuff to sources? why are they even
# available through default sources if those don't work...
sudo apt install r-base r-base-dev -y

# E.g. bionic (for 18.04) or xenial (for 16.04)
ubuntu_version_name="$(lsb_release -c | awk '{print $2}')"

# Use link to check if the version of the .deb referenced below needs updating.
# https://rstudio.com/products/rstudio/download/#download
# This may not always be the latest, but should work on any 64 bit Ubuntu 16.04+
r_studio_version="1.3.959"
deb="rstudio-${r_studio_version}-amd64.deb"

# From: 
# "RStudio 1.2 requires a 64-bit operating system. If you are on a 32 bit
# system, you can use an older version of RStudio."
# ...so we can probably just keep the amd64 part of the URL below hardcoded.

sudo apt-get install gdebi-core -y
# TODO i saw one other url that used download2 subdomain. does 'download' maybe
# point to the appropriate numbered subdomain / work itself? more reliable?
wget -nc https://download1.rstudio.org/desktop/$ubuntu_version_name/amd64/$deb

# Not clear what this provides on top of `dpkg -i <deb>`, but just going w/
# instructions for now.
# -n/--non-interactive may behave similarly to -y above, but gdebi seems to not
# recommend it...
# To uninstall what is installed in this line, this should work:
# sudo dpkg -r rstudio # (to uninstall but leave any config files)
# sudo dpkg -P rstudio # (to uninstall EVERYTHING, including config)
sudo gdebi --non-interactive $deb

# https://stackoverflow.com/questions/18306362
# You can just skip this step if reticulate is already installed.
# I'm not sure if this will error if already installed, or cause other problems
# then.
R -e 'install.packages(c("reticulate"))'

