variable "pilvio" {
  type = object({
    api_key = string
    billing_account_id = number
  })
  description = "Information about Pilvio account"
  sensitive = true
}
