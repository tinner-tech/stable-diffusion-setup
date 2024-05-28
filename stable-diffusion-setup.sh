#!/bin/bash

# Exit on error
set -e

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Download and Install Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
chmod +x Anaconda3-2022.05-Linux-x86_64.sh
./Anaconda3-2022.05-Linux-x86_64.sh -b

# Initialize Anaconda without reinitializing the shell
export PATH="$HOME/anaconda3/bin:$PATH"
source "$HOME/anaconda3/etc/profile.d/conda.sh"
conda config --set auto_activate_base false
conda init

# Download Model File
wget -O sd-v1-4.ckpt https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt

# Clone Stable Diffusion Repository
git clone https://github.com/CompVis/stable-diffusion
cd stable-diffusion

# Setup Directory for Model
mkdir -p models/ldm/stable-diffusion-v1/
mv ../sd-v1-4.ckpt models/ldm/stable-diffusion-v1/model.ckpt

# Setup Conda Environment
conda env create -f environment.yaml

echo "Setup complete. You can now use Stable Diffusion."
echo "Run the following command to start your conda environment: "
echo "conda activate ldm"
