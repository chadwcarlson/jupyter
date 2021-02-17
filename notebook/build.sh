#!/bin/bash

# Download an Anaconda3 release and name the file `conda.sh`

# echo "-------------------- 1 - Download Anaconda3 --------------------"
# curl https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh -o conda.sh

echo "-------------------- 1 - Download Miniconda3 --------------------"
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o conda.sh

# Run the downloaded `conda.sh` script using bash
# — Use the `-b` flag to run the installer in batch mode
# — Use the `-p` flag to specify where the package manager will actually be installed
echo "-------------------- 2 - Run conda.sh using bash --------------------"
bash conda.sh -b -p $PLATFORM_APP_DIR/conda

# Source the following `conda.sh` file to put the `conda` command in our path for the duration of this script
echo "-------------------- 3 - Source the conda command --------------------"
. $PLATFORM_APP_DIR/conda/etc/profile.d/conda.sh

# Add the above command to `.bash_profile` so that it is available during SSH sessions
echo "-------------------- 4 - Add conda command to .bash_profile --------------------"
echo ". $PLATFORM_APP_DIR/conda/etc/profile.d/conda.sh" >> ~/.bash_profile
echo "conda activate" >> ~/.bash_profile

echo "-------------------- 5 - Initial Clean up --------------------"
conda clean -all

# Enter the base conda environment and prepare to configure it
echo "-------------------- 6 - Activate the base environment --------------------"
conda activate base
echo "-------------------- 8 - Get info about available environments --------------------"
conda info --envs

# Update conda itself
echo "-------------------- 9 - Update the base environment defaults --------------------"
conda update -n base -c defaults conda
echo "-------------------- 10 - Clean up --------------------"
conda clean -all

# conda config --add channels conda-forge
# conda clean -all

# conda create -n sage
# conda clean -all

# conda activate sage
# conda clean -all

conda install jupyterlab
conda clean -all

conda install -c conda-forge jupyterlab
conda clean -all

# SAGE_VERSION=8.8

# curl -O http://mirrors.mit.edu/sage/src/sage-$SAGE_VERSION.tar.gz
# tar -xvf sage-$SAGE_VERSION.tar.gz
# mv sage-$SAGE_VERSION sage && rm sage-$SAGE_VERSION.tar.gz

make configure
./configure --with-python=3
make
#
# $SAGE_ROOT=~/PLAFORM_APP_DIR/sage
# ./configure --prefix=SAGE_LOCAL
#
# make




# echo "-------------------- 11 - Add the conda-forge channel --------------------"
# conda config --add channels conda-forge
# echo "-------------------- 12 - Clean up --------------------"
# conda clean -a -f

# echo "-------------------- 13 - Create the sage environment with sage --------------------"
# conda create --no-default-packages -n sage sage
# echo "-------------------- 14 - Clean up --------------------"
# conda clean -a -f

# echo "-------------------- 15 - Activate the sage environment --------------------"
# conda activate sage
# echo "-------------------- 16 - Clean up --------------------"
# conda clean -a -f
#
# echo "-------------------- 17 - Get info about available environments --------------------"
# conda info --envs
# echo "-------------------- 18 - Get info about the sage environment --------------------"
# conda info


# echo "-------------------- 17 - Install JupyterLab to the sage environment --------------------"
# # conda install sage
# # conda clean -a -f
# conda install jupyterlab
# conda clean -a -f
# # conda install -n sage jupyterlab
# echo "-------------------- 18 - Clean up --------------------"
# conda clean -a -f
