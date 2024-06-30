#!/bin/bash

KIND_CLUSTER_NAME="dataops-cluster"
NO_COLOR='\033[0m'
OK_COLOR='\033[32;01m'
ERR_COLOR='\033[0;31m'

# check that kind is installed
if ! command -v kind &> /dev/null
then
    printf "${ERR_COLOR}kind binary could not be found ${NO_COLOR}\n"
    exit 1
fi

# check that kubectl is installed
if ! command -v kubectl &> /dev/null
then
    printf "${ERR_COLOR}kubectl binary could not be found${NO_COLOR}\n"
    exit 1
fi

kind get clusters|grep  $KIND_CLUSTER_NAME &>/dev/null && printf "${ERR_COLOR}Cluster with name: ${KIND_CLUSTER_NAME} already exists....${NO_COLOR}\n" && exit 1


kind create cluster --name $KIND_CLUSTER_NAME --config ./kind/kind.yaml

# sleep for 15 seconds to allow the cluster to come up
sleep 15


# check that k8s context is correctly set
if kubectl config get-contexts |tail -n +2|awk {'print $2'}|grep -q "kind-${KIND_CLUSTER_NAME}"; then
    printf "${OK_COLOR}Cluster with name: ${KIND_CLUSTER_NAME} found and k8s context is correctly set. Continuing...${NO_COLOR}\n"
else
    printf "${ERR_COLOR}Cluster with name: ${KIND_CLUSTER_NAME} not found or k8s context is incorrect. Exiting...${NO_COLOR}\n"
    exit 1
fi
