mock_provider "aws" {}

run "basic" {
  command = plan

  variables {
    notification = {
      email = {
        addresses = ["security@example.com"]
      }
    }
    tags = {
      team = "security"
    }
  }

  assert {
    condition     = aws_cloudwatch_log_metric_filter.admin_sso_activity.0.log_group_name == "aws-controltower/CloudTrailLogs"
    error_message = "Name of CW log group associated with CW log metric filter is incorrect"
  }

  assert {
    condition     = aws_cloudwatch_metric_alarm.admin_sso_activity.0.alarm_name == "AdministratorSSOActivity"
    error_message = "CloudWatch alarm name is incorrect"
  }

  assert {
    condition     = aws_cloudwatch_metric_alarm.admin_sso_activity.0.namespace == "cis-benchmark"
    error_message = "CloudWatch alarm namespace name is incorrect"
  }
}


