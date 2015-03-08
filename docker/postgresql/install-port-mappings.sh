#!/bin/sh

COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_OFF='\033[0m'
MAPPED_PORT=49255

printf "\n${COLOR_LIGHT_GREEN}=====> Shutting down boot2docker ...${COLOR_OFF}\n"
boot2docker stop
printf "\n${COLOR_LIGHT_GREEN}=====> The boot2docker process has been shut down.${COLOR_OFF}\n"

printf "\n${COLOR_LIGHT_GREEN}=====> Configuring boot2docker-vm port forwarding for port $MAPPED_PORT ...${COLOR_OFF}\n"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$MAPPED_PORT,tcp,,$MAPPED_PORT,,$MAPPED_PORT";
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$MAPPED_PORT,udp,,$MAPPED_PORT,,$MAPPED_PORT";
printf "\n${COLOR_LIGHT_GREEN}=====> The boot2docker-vm port forwarding for port $MAPPED_PORT has been configured!${COLOR_OFF}\n"

printf "\n${COLOR_LIGHT_GREEN}=====> Starting up boot2docker ...${COLOR_OFF}\n"
boot2docker start
printf "\n${COLOR_LIGHT_GREEN}=====> The boot2docker process has been started!${COLOR_OFF}\n"



