#!/bin/bash

###########################
# Install conda
###########################

# Download the latest Miniconda3 release and name the file `conda.sh`
#
# Miniconda is a standalone package manager, while Anaconda is the package manager
# plus a large selection of bundled packages.
# If you wish to install Anaconda instead of Miniconda, replace the URL below as needed.
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o conda.sh

# Run the downloaded `conda.sh` script using bash
#
# — The `-b` flag runs the installer in batch mode, which automatically accepts the
# license agreement and makes no PATH modifications.
# — The `-p` flag specifies where the package manager will actually be installed
#
# More information on silent mode installation: https://conda.io/projects/conda/en/latest/user-guide/install/macos.html#installing-in-silent-mode
# (Note: In the above link, the `export PATH` command should not be included here.)
bash conda.sh -b -p $HOME/conda

# Sourcing this `conda.sh` file puts the `conda` command in our path for the
# duration of this script.
. /app/conda/etc/profile.d/conda.sh

# Add the above command to `.bash_profile` so that it is available during SSH sessions
echo ". /app/conda/etc/profile.d/conda.sh" >> ~/.bash_profile
echo "conda activate" >> ~/.bash_profile

###########################
# Configure conda
###########################

# Enter the base conda environment and prepare to configure it
conda activate base

# Update conda itself
conda update -n base -c defaults conda

# Print out debugging information
# conda info

###########################
# Install JupyterLab
###########################

# Create the environment for sage.
conda create -n sage
conda clean -all

# Activate the environment.
conda activate sage
conda clean -all

conda install jupyterlab
conda clean -all

###########################
# Install Sage from source
###########################

SAGE_VERSION=8.8

curl -O http://mirrors.mit.edu/sage/src/sage-$SAGE_VERSION.tar.gz
tar -xvf sage-$SAGE_VERSION.tar.gz
mv sage-$SAGE_VERSION sage && rm sage-$SAGE_VERSION.tar.gz

###########################
# Configure the Sage kernel
###########################

# jupyter kernelspec install --user ./sage
