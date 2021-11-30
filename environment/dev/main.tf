terraform {
    
    backend "azurerm" {
    resource_group_name  = "RG-Terraform"
    storage_account_name = "terraformmarcilli"
    container_name       = "envi-lab"
    key                  = "dev-terraform.tfstate"
    }
  }

provider "azurerm" {
    features {}
 }

# Resource Group Module
module "resource_group"{
  source = "../../modules/resource-group"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = "EastUS"
   
}

# # Storage Account Module
module "azurerm_storage_account"{
  source = "../../modules/storage-account"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
    
}


# VNET Module
module "azurerm_virtual_network"{
  source = "../../modules/vnet"
  project_name        = "FilipeLABS"
  environment         = "dev"
  location            = module.resource_group.location
  rg_name             = module.resource_group.name
  vnet_name           = "vnetlab"
  address_space       = ["10.0.0.0/16"]
  address_prefixes    = ["10.0.2.0/24"]
  
  }
  
    

# # VM Module
# module "azurerm_virtual_machine"{
#   source = "../../modules/VM"
#   project_name        = "FilipeLABS"
#   environment         = "dev"
#   location            = module.resource_group.location
#   rg_name             = module.resource_group.name
#   vnet_subnet_id      = module.azurerm_virtual_network.vnet_subnets[0]
   
# }





# Service Plan Module
# module "azurerm_app_service_plan"{
#   source = "../../modules/service-app"
#   project_name        = "FilipeLABS"
#   environment         = "dev"
#   location            = module.resource_group.location
#   rg_name             = module.resource_group.name
    
# }

# Service App Module
# module "azurerm_app_service"{
#   source = "../../modules/service-app"
#   project_name        = "FilipeLABS"
#   environment         = "dev"
#   location            = module.resource_group.location
#   rg_name             = module.resource_group.name
  
   
# }