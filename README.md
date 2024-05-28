# Stable Diffusion Setup Script on Ubuntu 22.04

This repository contains a script for automating the setup of Stable Diffusion on a Virtual Private Server (VPS) running Ubuntu 22.04. The script installs all necessary dependencies, configures the environment, and sets up Stable Diffusion so you can start generating images right away.

## Prerequisites

Before running the script, ensure your VPS meets the following criteria:
- Ubuntu 22.04 is installed.
- You have root access or can execute commands with `sudo`.
- The VPS has an Nvidia GPU (the script is optimized for this configuration).

## Installation

To install Stable Diffusion on your VPS, follow these steps:

### Step 1: Download the Script

First, download the setup script from this repository. You can do this using `wget` or `curl`:

```bash
git clone https://github.com/tinner-tech/stable-diffusion-setup.git
```

### Step 2: Make the Script Executable

```bash
cd stable-diffusion-setup
```

Change the script's permissions to make it executable:

```bash
chmod +x stable-diffusion-setup.sh
```

### Step 3: Run the Script

Run the script with root privileges to install and configure everything:

```bash
sudo ./stable-diffusion-setup.sh
```

### Step 4: Refresh Your Terminal Session

```bash
exec bash -l
```

### Step 5: Activate conda

```bash
conda activate ldm
```

### Step 6: Generate an Image

Move into the `stable-diffusion/` directory

```bash
cd stable-diffusion
```

Run the image generation script with a prompt

```bash
python scripts/txt2img.py --prompt "a photograph of an astronaut riding a horse" --plms
```

### Step 7: Download Image to Local Machine

Open a new terminal window on your local machine. This terminal session should *not* be connected to your VPS.

```bash
scp root@your-vps-ip:/root/stable-diffusion-setup/stable-diffusion/outputs/txt2img-samples/grid-0000.png .
```

## What the Script Does

The script performs the following actions:
- Updates system packages.
- Downloads and installs Anaconda.
- Sets up the Anaconda environment.
- Clones the Stable Diffusion repository.
- Downloads the model file required for image generation.
- Configures the environment to run Stable Diffusion.

## Security

This script requires root access to install system packages and configure the environment. Please review the script thoroughly before executing it to ensure it meets your security standards.

## Contributing

Contributions to this script are welcome. You can contribute by:
- Reporting issues
- Suggesting improvements
- Submitting pull requests with enhancements

---

For any questions or support, please open an issue in this repository.
