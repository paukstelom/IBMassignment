#!/bin/bash

PREFIX=IBM-ASSIGNMENT
RESOURCE_GROUP_NAME=$PREFIX-RG-STATE
STORAGE_ACCOUNT_NAME=stateaccount
CONTAINER_NAME=statecontainer
LOCATION=westeurope

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME