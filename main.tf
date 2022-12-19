terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.30.0"
    }
  }
}
provider "azurerm" {
  client_id                  = "9a137a74-927b-4842-bdd4-c1bdbcb812cf"
  client_secret              = "tfI8Q~s_Et_Iy2JKze2wT6v3YeyeeRNiRB4B3cCd"
  subscription_id            = "664b6097-19f2-42a3-be95-a4a6b4069f6b"
  tenant_id                  = "0adb040b-ca22-4ca6-9447-ab7b049a22ff"
  features {}
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {
        resource_group_name  = "sa1_test_eic_trainingRakesh"
        storage_account_name = "sa1sa"
        container_name       = "sa1sacontainer"
        key                  = "rakeshterraform.tfstate"
    }
    }

module "appservices" {
    source = "./modules/appservices"
    spname = var.spname 
    location = var.location
    #sp_id = var.sp_id
    wanames = var.wanames

}
module "storageaccount" {
    source = "./modules/storageaccount"
}
