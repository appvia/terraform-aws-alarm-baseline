
## Provision the notifications
module "notifications" {
  source  = "appvia/notifications/aws"
  version = "2.0.0"

  accounts_id_to_name_parameter_arn = var.accounts_id_to_name_parameter_arn
  allowed_aws_services              = ["cloudwatch.amazonaws.com"]
  cloudwatch_log_group_retention    = var.cloudwatch_log_group_retention
  create_sns_topic                  = var.create_sns_topic
  email                             = local.email_configuration
  enable_slack                      = local.enable_slack
  identity_center_role              = var.identity_center_role
  identity_center_start_url         = var.identity_center_start_url
  slack                             = local.slack_configuration
  sns_topic_name                    = var.sns_topic_name
  tags                              = var.tags
}
