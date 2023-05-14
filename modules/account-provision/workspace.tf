data "tfe_project" "this" {
  name         = var.tfc_project
  organization = var.tfc_organization
}

# terraform cloud workspace for global customizations
resource "tfe_workspace" "global-customizations" {
  name         = local.global_customizations_workspace_name
  organization = var.tfc_organization
  project_id   = data.tfe_project.this.id
  auto_apply   = true
  vcs_repo {
    identifier                 = var.vcs_global_customizations_repo
    github_app_installation_id = var.tfc_github_app_installation_id
  }
}

resource "tfe_variable" "global-customizations-aws-provider-auth" {
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "terraform"
  workspace_id = tfe_workspace.global-customizations.id
}

resource "tfe_variable" "global-customizations-aws-run-role-arn" {
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = "arn:aws:iam::${aws_organizations_account.account.id}:role/tf-cloud-admin"
  category     = "terraform"
  workspace_id = tfe_workspace.global-customizations.id
}

# terraform cloud workspace for account customizations
resource "tfe_workspace" "account-customizations" {
  name         = local.account_customizations_workspace_name
  organization = var.tfc_organization
  project_id   = data.tfe_project.this.id
  auto_apply   = true
  vcs_repo {
    identifier                 = var.vcs_account_customizations_repo
    github_app_installation_id = var.tfc_github_app_installation_id
  }
}

resource "tfe_variable" "account-customizations-aws-provider-auth" {
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "terraform"
  workspace_id = tfe_workspace.account-customizations.id
}

resource "tfe_variable" "account-customizations-aws-run-role-arn" {
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = local.account_admin_tfc_role_arn
  category     = "terraform"
  workspace_id = tfe_workspace.account-customizations.id
}