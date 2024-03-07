terraform {
/*   backend "s3" {
    endpoints = {
      s3 = "https://s3.pilw.io"
    }
    bucket = "terraform-states"
    key    = "pilvio-nextcloud"
    region = "us-east-1"
    use_path_style = true
    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_metadata_api_check = true
    skip_s3_checksum = true
  } */
  required_providers {
    pilvio = {
      source = "pilvio-com/pilvio"
      version = "1.0.13"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "pilvio" {
  host     = "api.pilvio.com"
  apikey   = var.pilvio.api_key
  location = "tll01"
}

provider "aws" {
  region  = "eu-north-1"
  access_key = var.aws.access_key
  secret_key = var.aws.secret_key
}