data "aws_caller_identity" "current" {}

# allow the specified terraform cloud project to assume the tfc automation role
resource "aws_iam_role" "tfc_automation" {
  provider = aws.new-account
  name     = local.account_tfc_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/app.terraform.io"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "app.terraform.io:aud" = "aws.workload.identity"
          }
          StringLike = {
            "app.terraform.io:sub" = "organization:${var.tfc_organization}:project:${var.tfc_project}:workspace:${local.global_customizations_workspace_name}:run_phase:*"
          }
        }
      },
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${aws_organizations_account.account.id}:oidc-provider/app.terraform.io"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "app.terraform.io:aud" = "aws.workload.identity"
          }
          StringLike = {
            "app.terraform.io:sub" = "organization:${var.tfc_organization}:project:${var.tfc_project}:workspace:${local.account_customizations_workspace_name}:run_phase:*"
          }
        }
      },
    ]
  })
}
