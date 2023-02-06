terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    namedotcom = {
      source = "lexfrei/namedotcom"
      version = "1.2.4"
    }
  }
}
  
# Configure the AWS Provider
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "namedotcom" {
  token = var.token
  username = var.username
}
