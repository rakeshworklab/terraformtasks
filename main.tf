provider "azurerm" {
  client_id                  = "9a137a74-927b-4842-bdd4-c1bdbcb812cf"
  client_secret              = "cfac2727-bac7-4b31-b826-853d933f466f"
  subscription_id            = "664b6097-19f2-42a3-be95-a4a6b4069f6b"
  tenant_id                  = "0adb040b-ca22-4ca6-9447-ab7b049a22ff"
  version                    = "~> 2.95.0"
}

terraform {
  backend "azurerm" {
        resource_group_name  = "sa1_test_eic_trainingRakesh"
        storage_account_name = "rakeshbackendstore"
        container_name       = "rakeshtfstate"
        key                  = "rakeshterraform.tfstate"
    }
    }
