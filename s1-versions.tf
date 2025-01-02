# Terraform Block
terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 4.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "remote-storage-rg"
    storage_account_name  = "remotestate93"
    container_name        = "tfstatefiles"
    key                   = "terraform.tfstate"
  } 
}

# Provider Block
provider "azurerm" {
 features {}          
 subscription_id = "75cdbbaa-111a-4556-99f4-1af6fd6b41d5"
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false   
}


