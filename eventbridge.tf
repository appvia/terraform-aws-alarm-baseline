# EventBridge Rule (RDS Extended Support Billing)
resource "aws_cloudwatch_event_rule" "rds_extended_support_billing" {
  name        = "rds-extended-support-billing-notification"
  description = "Captures AWS Billing notifications for RDS Extended Support"

  event_pattern = jsonencode({
    "source" : ["aws.health"],
    "detail" : {
      "eventTypeCode" : ["AWS_BILLING_NOTIFICATION"],
      "eventDescription" : [{
        "latestDescription" : [{
          "wildcard" : ["*RDS Extended Support*"]
        }]
      }]
    }
  })
}

resource "aws_cloudwatch_event_target" "rds_extended_support_billing" {
  rule = aws_cloudwatch_event_rule.rds_extended_support_billing.name
  arn  = local.sns_topic_arn
}

# EventBridge Rule (EKS Extended Support Billing)
resource "aws_cloudwatch_event_rule" "eks_extended_support_billing" {
  name        = "rds-extended-support-billing-notification"
  description = "Captures AWS Billing notifications for EKS Extended Support"

  event_pattern = jsonencode({
    "source" : ["aws.health"],
    "detail" : {
      "eventTypeCode" : ["AWS_BILLING_NOTIFICATION"],
      "eventDescription" : [{
        "latestDescription" : [{
          "wildcard" : ["*EKS Extended Support*"]
        }]
      }]
    }
  })
}

resource "aws_cloudwatch_event_target" "eks_extended_support_billing" {
  rule = aws_cloudwatch_event_rule.rds_extended_support_billing.name
  arn  = local.sns_topic_arn
}
