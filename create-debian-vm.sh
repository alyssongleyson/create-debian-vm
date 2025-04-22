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
INTERFACE=$(Ip route | grep default | awk '{print $5}')
echo "Using network interface: $INTERFACE"
VBoxManage modifyvm "$VM_NAME" --nic1 bridged --bridgeadapter1 "$INTERFACE"

