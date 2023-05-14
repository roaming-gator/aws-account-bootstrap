terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    jinja = {
      source  = "NikolaLohinski/jinja"
      version = "~> 1.13"
    }
    tfe = {
      version = "~> 0.44.0"
    }
  }
}

provider "tfe" {
  token        = var.tfc_token
  organization = var.tfc_organization
}

provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "new-account"
  region = var.aws_region
  assume_role {
    role_arn = local.account_admin_role_arn
  }
}
