data "jinja_template" "email" {
  template = var.account_email_template
  context {
    data = jsonencode({
      account_name = var.account_name
    })
    type = "json"
  }
}

resource "aws_organizations_account" "account" {
  name      = var.account_name
  email     = data.jinja_template.email.result
  role_name = local.account_admin_role

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
}
