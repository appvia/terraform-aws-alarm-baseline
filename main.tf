data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  # is the slack notification enabled 
  enable_slack = var.notification.slack != null && var.notification.slack.webhook_url != null
  # is email notification enabled
  enable_email = var.notification.email != null && length(var.notification.email.addresses) > 0
  # sns topic arn 
  sns_topic_arn = var.create_sns_topic ? module.notifications[0].topic_arn : format("arn:aws:sns:%s::%s", local.account_id, var.sns_topic_name)
}

#
## Provision the SNS topic for the budgets 
#
module "notifications" {
  source  = "terraform-aws-modules/sns/aws"
  version = "v6.0.1"
  count   = var.create_sns_topic ? 1 : 0

  name = var.sns_topic_name
  tags = var.tags
  topic_policy_statements = {
    "AllowSNSPublish" = {
      actions = ["sns:Publish"]
      effect  = "Allow"

      principals = [{
        type        = "Service"
        identifiers = ["cloudwatch.amazonaws.com"]
      }]

      condition = [{
        test     = "ArnLike"
        variable = "AWS:SourceArn"
        values   = ["arn:aws:cloudwatch:${local.region}:${local.account_id}:alarm:*"]
      }]
    }
  }
}

#
## Provision email notification for the SNS topic_arn
#
resource "aws_sns_topic_subscription" "emails" {
  for_each = local.enable_email ? { for x in var.notification.email.addresses : x => x } : {}

  topic_arn = local.sns_topic_arn
  protocol  = "email"
  endpoint  = each.value
}

#
## Provision the slack notification if enabled
#
# tfsec:ignore:aws-lambda-enable-tracing
# tfsec:ignore:aws-lambda-restrict-source-arn
module "slack" {
  count   = local.enable_slack ? 1 : 0
  source  = "terraform-aws-modules/notify-slack/aws"
  version = "6.1.1"

  create_sns_topic     = false
  lambda_function_name = var.notification.slack.lambda_name
  slack_channel        = var.notification.slack.channel
  slack_username       = ":aws: CIS Benchmark"
  slack_webhook_url    = var.notification.slack.webhook_url
  sns_topic_name       = var.sns_topic_name
  tags                 = var.tags
}
