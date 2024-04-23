
locals {
  ## The current account id 
  account_id = data.aws_caller_identity.current.account_id

  ## The configuration for the slack notification 
  slack_configuration = var.notification.slack != null ? {
    channel     = var.notification.slack.channel
    lambda_name = var.notification.slack.lambda_name
    webhook_url = var.notification.slack.webhook_url
  } : null

  ## The email configuration to use for notification
  email_configuration = var.notification.email != null ? {
    addresses = var.notification.email.addresses
  } : null

  ## Is the arn of the sns topic to use, created or existing 
  sns_topic_arn = var.create_sns_topic ? module.notifications.sns_topic_arn : format("arn:aws:sns:%s::%s", local.account_id, var.sns_topic_name)
}
