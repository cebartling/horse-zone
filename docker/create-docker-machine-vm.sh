#!/usr/bin/env bash

COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_OFF='\033[0m'
MACHINE_NAME='horse-zone'


printf "\n${COLOR_LIGHT_GREEN}=====> Creating docker-machine VirtualBox VM: ${MACHINE_NAME}...${COLOR_OFF}\n"
docker-machine create --driver virtualbox --virtualbox-cpu-count "2" --virtualbox-disk-size "10000" --virtualbox-memory "2048" ${MACHINE_NAME}
docker-machine env ${MACHINE_NAME}
printf "\n${COLOR_LIGHT_GREEN}=====> Successfully created docker-machine VirtualBox VM: ${MACHINE_NAME}.${COLOR_OFF}\n"
