# EventBridge Rule (RDS Extended Support Billing)
resource "aws_cloudwatch_event_rule" "rds_extended_support_billing" {
  count       = var.enable_aws_extended_support_alerts ? 1 : 0
  name        = "rds-extended-support-billing-notification"
  description = "Captures AWS Billing notifications for RDS Extended Support"

  event_pattern = jsonencode({
    "source" : ["aws.health"],
    "detail-type" : ["AWS Health Event"],
    "detail" : {
      "eventTypeCode" : ["AWS_BILLING_NOTIFICATION"],
      "eventDescription" : [{
        "wildcard" : "*RDS Extended Support*"
      }]
    }
  })
}

resource "aws_cloudwatch_event_target" "rds_extended_support_billing" {
  count = var.enable_aws_extended_support_alerts ? 1 : 0
  rule  = aws_cloudwatch_event_rule.rds_extended_support_billing[0].name
  arn   = var.sns_topic_arn
}

# EventBridge Rule (EKS Extended Support Billing)
resource "aws_cloudwatch_event_rule" "eks_extended_support_billing" {
  count       = var.enable_aws_extended_support_alerts ? 1 : 0
  name        = "eks-extended-support-billing-notification"
  description = "Captures AWS Billing notifications for EKS Extended Support"

  event_pattern = jsonencode({
    "source" : ["aws.health"],
    "detail-type" : ["AWS Health Event"],
    "detail" : {
      "eventTypeCode" : ["AWS_BILLING_NOTIFICATION"],
      "eventDescription" : [{
        "wildcard" : "*EKS Extended Support*"
      }]
    }
  })
}

resource "aws_cloudwatch_event_target" "eks_extended_support_billing" {
  count = var.enable_aws_extended_support_alerts ? 1 : 0
  rule  = aws_cloudwatch_event_rule.eks_extended_support_billing[0].name
  arn   = var.sns_topic_arn
}
