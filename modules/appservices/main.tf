resource "azurerm_service_plan" "sa1spd" {
  name                = var.spname
  resource_group_name = "sa1_test_eic_trainingRakesh"
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
  tags = {
    Resource = "serviceplan"
    Resource_owner = "RakeshkumarReddy"
    project_manager = "sumanthnath"
    Business_unit = "einfochips"
    Sub_business_unit = "digital"
    Project_name = "training"
    Create_date = "14/12/2022"
  }
}

/*resource "azurerm_app_service" "rakesh_sample_webapp" {
 for_each = toset(["sa1wa1","sa1wa2" ])
  name                = each.key
  location            = "Southeast Asia"
  resource_group_name = "sa1_test_eic_trainingRakesh"
  app_service_plan_id = module.appservices.app_serviceplanid_out

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
  tags = {
    Resource = "appservice"
    Resource_owner = "RakeshkumarReddy"
    project_manager = "sumanthnath"
    Business_unit = "einfochips"
    Sub_business_unit = "digital"
    Project_name = "training"
    Create_date = "07/12/2022"
  }
}*/
resource "azurerm_linux_web_app" "dynamicwebapp" {
  for_each = toset(var.wanames)
  name                = each.key
  resource_group_name =  "sa1_test_eic_trainingRakesh"
  location            = var.location
  service_plan_id     = azurerm_service_plan.sa1spd.id
  #service_plan_id = var.sp_id

  site_config {}
  app_settings = {
    "SOME_KEY" = "some-value"
  }
  tags = {
    Resource = "webapp"
    Resource_owner = "RakeshkumarReddy"
    project_manager = "sumanthnath"
    Business_unit = "einfochips"
    Sub_business_unit = "digital"
    Project_name = "training"
    Create_date = "14/12/2022"
  }
}
