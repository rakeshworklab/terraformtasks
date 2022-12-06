terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.95.0"
    }
  }
}
provider "azurerm" {
  client_id                  = "9a137a74-927b-4842-bdd4-c1bdbcb812cf"
  client_secret              = "tfI8Q~s_Et_Iy2JKze2wT6v3YeyeeRNiRB4B3cCd"
  subscription_id            = "664b6097-19f2-42a3-be95-a4a6b4069f6b"
  tenant_id                  = "0adb040b-ca22-4ca6-9447-ab7b049a22ff"
  #version                    = "~> 2.95.0"
  features {}
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {
        resource_group_name  = "sa1_test_eic_trainingRakesh"
        storage_account_name = "rakeshbackendstore"
        container_name       = "rakeshtfstate"
        key                  = "rakeshterraform.tfstate"
    }
    }

resource "azurerm_app_service_plan" "rakeshservice_plan" {
  name                = "rakeshservice_plan"
  location            = "Southeast Asia"
  resource_group_name = "sa1_test_eic_trainingRakesh"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "rakesh_sample_webapp" {
  name                = "rakeshsample-webapp"
  location            = "Southeast Asia"
  resource_group_name = "sa1_test_eic_trainingRakesh"
  app_service_plan_id = azurerm_app_service_plan.rakeshservice_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
}
#thankou
