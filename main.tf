
## Provision the notifications  
module "notifications" {
  source  = "appvia/notifications/aws"
  version = "0.1.4"

  allowed_aws_services = ["cloudwatch.amazonaws.com"]
  create_sns_topic     = var.create_sns_topic
  email                = local.email_configuration
  slack                = local.slack_configuration
  sns_topic_name       = var.sns_topic_name
  tags                 = var.tags
}
