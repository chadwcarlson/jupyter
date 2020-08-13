#!/bin/bash

. /app/conda/etc/profile.d/conda.sh

# conda deactivate
conda activate sage

# jupyter lab configuration
jupyter lab --generate-config
rm .jupyter/jupyter_notebook_config.py
mv config/jupyter_notebook_config.py .jupyter/
