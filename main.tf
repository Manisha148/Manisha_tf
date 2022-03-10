terraform{
    required_providers {
    }
}
provider "azurerm" {
    features {}
    
  
}
resource "azurerm_resource_group" "manisha" {
    name="rg_manisha_dev"
    location ="central india"
  
}
resource "azurerm_resource_group" "m1" {
  name     = var.dev1_var
  location = "central india"
}
resource "azurerm_resource_group" "m2" {
  name     = var.qa1_var
  location = "central india"
}

resource "azurerm_app_service_plan" "manisha" {
    name="manisha"
    resource_group_name= azurerm_resource_group.manisha.name
    location= azurerm_resource_group.manisha.location 
    sku{
        tier ="standard"
        size="s1"
    }
    
}
resource "azurerm_app_service" "manishaverma" {
     name                = "manishaverma-app-service"
  location            = azurerm_resource_group.manisha.location
  resource_group_name = azurerm_resource_group.manisha.name
  app_service_plan_id = azurerm_app_service_plan.manisha.id

  
}
resource "azurerm_storage_account" "manisha001" {
  name                     = "storageaccountmanisha001"
  resource_group_name      = azurerm_resource_group.manisha.name
  location                 = azurerm_resource_group.manisha.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}




