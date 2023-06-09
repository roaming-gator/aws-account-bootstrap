variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "tfc_token" {
  description = "Token for Terraform Cloud"
  type        = string
}

variable "tfc_organization" {
  description = "Organization for Terraform Cloud"
  type        = string
}

variable "account_email_template" {
  description = "Jinja template for account email, just to keep my email private. Should replace account_name jinja variable."
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
