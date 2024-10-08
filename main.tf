
## Provision the notifications  
module "notifications" {
  source  = "appvia/notifications/aws"
  version = "1.0.5"

  allowed_aws_services           = ["cloudwatch.amazonaws.com"]
  create_sns_topic               = var.create_sns_topic
  email                          = local.email_configuration
  enable_slack                   = local.enable_slack
  slack                          = local.slack_configuration
  sns_topic_name                 = var.sns_topic_name
  tags                           = var.tags
  accounts_id_to_name            = var.accounts_id_to_name
  cloudwatch_log_group_retention = var.cloudwatch_log_group_retention
  identity_center_start_url      = var.identity_center_start_url
  identity_center_role           = var.identity_center_role
}
