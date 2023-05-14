terraform {
  required_version = ">= 1.4.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    tfe = {
      version = "~> 0.44.0"
    }

  }
}

provider "aws" {
  region = var.aws_region
}

provider "tfe" {
  token        = var.tfc_token
  organization = var.tfc_organization
}
