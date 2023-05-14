# list of accounts to create

module "slackgpt-test" {
  source = "./modules/account-provision"

  account_name                    = "slackgpt-test"
  tfc_project                     = "slackgpt"
  account_email_template          = var.account_email_template
  tfc_organization                = var.tfc_organization
  tfc_token                       = var.tfc_token
  vcs_global_customizations_repo  = var.vcs_global_customizations_repo
  tfc_github_app_installation_id  = var.tfc_github_app_installation_id
  vcs_account_customizations_repo = var.vcs_account_customizations_repo
  aws_region                      = var.aws_region
}
