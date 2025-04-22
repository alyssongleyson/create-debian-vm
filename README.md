# create-debian-vm

[![License: MIT](https://img.shields.io/npm/l/react)](https://github.com/alyssongleyson/create-debian-vm/blob/main/LICENSE)

Script for creating virtual machines with Debian.

This script was developed to speed up the creation of virtual machines using Debian.

Since I frequently use VMs — especially Debian-based ones — I created this script with the ideal configurations I commonly use in my daily workflow.

## Features

- Automatically creates a Virtualbox VM with Debian
- Sets up memory, VRAM, and disk size
- Configures bridged network
- Adds shared folder with host machine
- Attaches empty CD/DVD drive for ISO boot

## Requirements

- [VirtualBox](https://www.virtualbox.org/) installed and accessible via terminal
- Bash shell
- Linux host system

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/alyssongleyson/create-debian-vm.git
   cd create-debian-vm
   ```

2. Make the script executable:
	```bash
	chmod +x create-debian-vm.sh
	```

3. Run the script:
	```bash
	./create-debian-vm.sh
	```
	


## Author

**Alysson Gleyson da Silva**  
GitHub: [@alyssongleyson](https://github.com/alyssongleyson) 

