resource "azurerm_app_service_plan" "appservplan" {
  name                = "${var.prefix}-${var.appservplan}"
  location            = var.location
  resource_group_name = var.rg_name

  sku {
    tier = "PremiumV2"
    size = "P1v2"
  }
}

resource "azurerm_app_service" "appserv" {
  name                = "${var.prefix}-${var.appserv}"
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.appservplan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
}
