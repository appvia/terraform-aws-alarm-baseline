
module "notifications" {
  source = "../.."

  enable_no_mfa_console_signin = true
  notification = {
    email = {
      addresses = ["security@example.com"]
    }
  }
  tags = var.tags
}
