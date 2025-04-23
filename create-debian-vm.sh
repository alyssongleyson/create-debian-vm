#!/bin/bash

###################################################################
# Script Name:	create-debian-vm.sh
# Description:	Script for creating virtual machine with debian
# Author:	Álysson Gleyson da Silva
###################################################################



# VM Settings
VM_NAME="Debian"
RAM_MB=2048
DISK_SIZE_MB=20280
SHARED_FOLDER="$HOME/VM-shared-folder"

# VM Creation
echo "Creating VM '$VM_NAME'..."
VBoxManage createvm --name "$VM_NAME" --ostype "Debian_64" --register

# Hardware Settings
VBoxManage modifyvm "$VM_NAME" \
	--memory $RAM_MB \
	--vram 256 \
	--graphicscontroller vmsvga \
	--accelerate3d on \
	--clipboard bidirectional

# Rede Settings
INTERFACE=$(ip route | grep default | awk '{print $5}')
echo "Using network interface: $INTERFACE"
VBoxManage modifyvm "$VM_NAME" --nic1 bridged --bridgeadapter1 "$INTERFACE"

# Hard Disk Configuration
DISK_PATH="$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi"
VBoxManage createmedium disk --filename "$DISK_PATH" --size $DISK_SIZE_MB --format VDI
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$DISK_PATH"

# CD/DVD Controller
VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium emptydrive

# Shared Folder
mkdir -p "$SHARED_FOLDER"
VBoxManage sharedfolder add "$VM_NAME" --name "Shared" --hostpath "$SHARED_FOLDER" --automount


