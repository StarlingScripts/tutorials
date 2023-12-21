terraform {
  required_providers {
    pilvio = {
      source = "pilvio-com/pilvio"
      version = "1.0.9"
    }
  }
}

provider "pilvio" {
  host     = "api.pilvio.com"
  apikey   = var.pilvio.api_key
  location = "tll01"
}
