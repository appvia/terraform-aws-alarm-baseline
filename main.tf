
## Provision the notifications  
module "notifications" {
  source  = "appvia/notifications/aws"
  version = "1.0.2"

  allowed_aws_services = ["cloudwatch.amazonaws.com"]
  create_sns_topic     = var.create_sns_topic
  email                = local.email_configuration
  enable_slack         = local.enable_slack
  slack                = local.slack_configuration
  sns_topic_name       = var.sns_topic_name
  tags                 = var.tags
  accounts_id_to_name  = var.accounts_id_to_name
}
