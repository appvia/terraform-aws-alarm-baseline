
module "notifications" {
  source = "../.."

  enable_no_mfa_console_signin = true
  sns_topic_arn                = "arn:aws:sns:us-east-1:123456789012:my-topic"
  tags                         = var.tags
}
