#!/bin/sh

COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_OFF='\033[0m'
MAPPED_PORT=49255

printf "\n${COLOR_LIGHT_GREEN}=====> Shutting down boot2docker ...${COLOR_OFF}\n"
boot2docker stop
printf "\n${COLOR_LIGHT_GREEN}=====> The boot2docker process has been shut down.${COLOR_OFF}\n"

printf "\n${COLOR_LIGHT_GREEN}=====> Removing boot2docker-vm port forwarding for port $MAPPED_PORT ...${COLOR_OFF}\n"
VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "tcp-port$MAPPED_PORT";
VBoxManage modifyvm "boot2docker-vm" --natpf1 delete "udp-port$MAPPED_PORT";
printf "\n${COLOR_LIGHT_GREEN}=====> The boot2docker-vm port forwarding for port $MAPPED_PORT has been removed!${COLOR_OFF}\n"

