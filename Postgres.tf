provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "practicum" {
  name     = "practicum-rg"
  location = "centralus"  # ✅ Use a region that is NOT restricted
}

resource "azurerm_postgresql_flexible_server" "primes" {
  name                   = "p466-postgres-tarashbudhrani"  # ✅ Use unique name
  resource_group_name    = azurerm_resource_group.practicum.name
  location               = azurerm_resource_group.practicum.location
  administrator_login    = var.db_admin_username
  administrator_password = var.db_admin_password
  sku_name               = "GP_Standard_D2s_v3"  # ✅ Valid and supported SKU
  version                = "13"
  storage_mb             = 32768
  zone                   = "1"
  public_network_access_enabled = true
}

resource "azurerm_postgresql_flexible_server_database" "primesdb" {
  name      = "primes"
  server_id = azurerm_postgresql_flexible_server.primes.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}
