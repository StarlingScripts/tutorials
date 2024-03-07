resource "pilvio_bucket" "pio" {
  name               = "nextcloud"
  billing_account_id = var.pilvio.billing_account_id
}