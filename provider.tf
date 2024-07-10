provider "aws" {
  region = local.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }
  }
}