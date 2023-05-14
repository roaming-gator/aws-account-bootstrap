variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "account_name" {
  description = "Name of the account"
  type        = string
}

variable "account_email_template" {
  description = "Jinja template for account email, just to keep my email private. Should replace account_name jinja variable."
  type        = string
}

variable "tfc_organization" {
  description = "Name of the Terraform Cloud organization"
  type        = string
}

variable "tfc_token" {
  description = "Terraform Cloud API token"
  type        = string
}

variable "tfc_project" {
  description = "Name of the Terraform Cloud project to store the created workspaces (should already exist)"
  type        = string
}

variable "vcs_global_customizations_repo" {
  description = "VCS repository for global customizations"
  type        = string
}

variable "vcs_account_customizations_repo" {
  description = "VCS repository for account customizations"
  type        = string
}

variable "tfc_github_app_installation_id" {
  description = "GitHub App installation ID for Terraform Cloud"
  type        = string
}

