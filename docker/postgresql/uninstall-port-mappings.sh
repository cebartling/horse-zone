#!/bin/sh

COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_OFF='\033[0m'
MAPPED_PORT=49255
DOCKER_MACHINE_NAME='horse-zone'

printf "\n${COLOR_LIGHT_GREEN}=====> Shutting down docker-machine: '${DOCKER_MACHINE_NAME}'...${COLOR_OFF}\n"
docker-machine stop ${DOCKER_MACHINE_NAME}
printf "\n${COLOR_LIGHT_GREEN}=====> The docker-machine process has been shut down.${COLOR_OFF}\n"

printf "\n${COLOR_LIGHT_GREEN}=====> Removing '${DOCKER_MACHINE_NAME}' VM port forwarding for port $MAPPED_PORT ...${COLOR_OFF}\n"
VBoxManage modifyvm "${DOCKER_MACHINE_NAME}" --natpf1 delete "tcp-port$MAPPED_PORT";
VBoxManage modifyvm "${DOCKER_MACHINE_NAME}" --natpf1 delete "udp-port$MAPPED_PORT";
printf "\n${COLOR_LIGHT_GREEN}=====> The '${DOCKER_MACHINE_NAME}' VM port forwarding for port $MAPPED_PORT has been removed!${COLOR_OFF}\n"

