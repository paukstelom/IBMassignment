#!/bin/bash

PREFIX=$1
LOCATION=$2
STORAGE_ACCOUNT_NAME=$3
CONTAINER_NAME=$4

RESOURCE_GROUP_NAME=$PREFIX-RG-STATE

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME