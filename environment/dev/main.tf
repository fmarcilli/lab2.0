terraform {
    
    backend "azurerm" {
    resource_group_name  = "RG-Terraform"
    storage_account_name = "terraformmarcilli"
    container_name       = "envi-lab"
    key                  = "dev-terraform-keyvault.tfstate"
    }
  }

provider "azurerm" {
    features {}
 }


## LAB DEV v2.1 - Criação de RG e KeyVault


## Resource Group Module
# module "resource_group_lab"{
#   source = "../../modules/resource-group"
#   project_name        = "FilipeLABS1"
#   environment         = "dev"
#   location            = "EastUS"   
# }


## Key Vault Module
# module "keyvault"{
#   source = "../../modules/keyvault"
#   project_name        = "FLABS"
#   environment         = "dev"
#   location            = module.resource_group_lab.location
#   rg_name             = module.resource_group_lab.name

# }


