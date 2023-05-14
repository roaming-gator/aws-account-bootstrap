locals {
  # role assumed by root account, automatically created when account is provisioned
  account_admin_role     = "admin-automation"
  account_admin_role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/${local.account_admin_role}"
  # role assumed by global/account customization workspaces in terraform cloud, which we create in terraform
  account_tfc_role                      = "tfc-automation"
  account_admin_tfc_role_arn            = "arn:aws:iam::${aws_organizations_account.account.id}:role/${local.account_tfc_role}"
  global_customizations_workspace_name  = "aws-global-customizations-${aws_organizations_account.account.id}"
  account_customizations_workspace_name = "aws-account-customizations-${aws_organizations_account.account.id}"
}
