#!/bin/bash

GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

printf "${GREEN}Pulling Docker image (should have already been done, just making sure)${NORMAL}\n"
docker pull tensorflow/tfx:workshop-latest

printf "${GREEN}Creating directories${NORMAL}\n"
mkdir workshop
mkdir workshop/airflow
cd workshop
export WSHOME=$PWD

printf "${GREEN}Cloning TFX${NORMAL}\n"
git clone https://github.com/tensorflow/tfx.git
cd tfx
git checkout -f origin/r0.14
rm -rf tfx/examples/containers/workshop

printf "${GREEN}Starting workshop container${NORMAL}\n"
docker-compose -f tfx/examples/containers/airflow_workshop/docker-compose.yaml run --service-ports tfx
