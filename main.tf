resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "this" {
  name                = "asp-${var.env_name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  sku {
    tier = var.sku.tier
    size = var.sku.size
  }
}

resource "azurerm_app_service" "this" {
  name                = "${var.identifier}-${var.env_name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.this.id

  connection_string {
    name  = var.connection_string.name
    type  = var.connection_string.type
    value = var.connection_string.value
  }

  tags = var.tags
}
