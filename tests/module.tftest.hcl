mock_provider "aws" {}

run "basic" {
  command = plan

  variables {
    sns_topic_arn = "arn:aws:sns:us-west-2:123456789012:security"
    tags = {
      team = "security"
    }
  }

  assert {
    condition     = aws_cloudwatch_log_metric_filter.admin_sso_activity.0.log_group_name == "aws-controltower/CloudTrailLogs"
    error_message = "CloudWatch log group name associated with CW log metric filter is incorrect"
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

run "stackset_instance_failure" {
  command = plan

  variables {
    sns_topic_arn = "arn:aws:sns:us-west-2:123456789012:security"
    tags = {
      team = "security"
    }
  }

  assert {
    condition     = aws_cloudwatch_event_rule.stackset_instance_failure.0.name == "cloudformation-stackset-instance-failure-notification"
    error_message = "EventBridge rule name for the StackSet instance failure alert is incorrect"
  }

  assert {
    condition     = jsondecode(aws_cloudwatch_event_rule.stackset_instance_failure.0.event_pattern).source[0] == "aws.cloudformation"
    error_message = "EventBridge rule event source is incorrect"
  }

  assert {
    condition     = jsondecode(aws_cloudwatch_event_rule.stackset_instance_failure.0.event_pattern)["detail-type"][0] == "CloudFormation StackSet StackInstance Status Change"
    error_message = "EventBridge rule detail-type is incorrect"
  }

  assert {
    condition     = tolist(jsondecode(aws_cloudwatch_event_rule.stackset_instance_failure.0.event_pattern).detail["status-details"]["detailed-status"]) == tolist(["FAILED", "FAILED_IMPORT"])
    error_message = "EventBridge rule detailed-status filter is incorrect"
  }

  assert {
    condition     = aws_cloudwatch_event_target.stackset_instance_failure.0.rule == aws_cloudwatch_event_rule.stackset_instance_failure.0.name
    error_message = "EventBridge target is not wired to the StackSet instance failure rule"
  }

  assert {
    condition     = aws_cloudwatch_event_target.stackset_instance_failure.0.arn == "arn:aws:sns:us-west-2:123456789012:security"
    error_message = "EventBridge target ARN does not match the configured SNS topic"
  }
}

run "without_sns_topic" {
  command = plan

  variables {
    tags = {
      team = "security"
    }
  }

  assert {
    condition     = length(aws_cloudwatch_metric_alarm.admin_sso_activity.0.alarm_actions) == 0
    error_message = "Alarm actions should be empty when no SNS topic is provided"
  }

  assert {
    condition     = length(aws_cloudwatch_metric_alarm.breakglass_activity) == 1
    error_message = "Alarms should still be created when no SNS topic is provided"
  }

  assert {
    condition     = length(aws_cloudwatch_event_rule.stackset_instance_failure) == 1 && length(aws_cloudwatch_event_target.stackset_instance_failure) == 0
    error_message = "EventBridge rules should be created without targets when no SNS topic is provided"
  }

  assert {
    condition     = length(aws_cloudwatch_event_target.rds_extended_support_billing) == 0 && length(aws_cloudwatch_event_target.eks_extended_support_billing) == 0
    error_message = "EventBridge extended support targets should not be created when no SNS topic is provided"
  }
}

run "default_identity_names" {
  command = plan

  variables {
    sns_topic_arn = "arn:aws:sns:us-west-2:123456789012:security"
    tags = {
      team = "security"
    }
  }

  assert {
    condition     = tolist(aws_cloudwatch_metric_alarm.admin_sso_activity.0.alarm_actions) == tolist(["arn:aws:sns:us-west-2:123456789012:security"])
    error_message = "Alarm actions should contain the SNS topic"
  }

  assert {
    condition     = strcontains(aws_cloudwatch_log_metric_filter.admin_sso_activity.0.pattern, "userName = AWSReservedSSO_Administrator*  &&")
    error_message = "Default administrator SSO role name is incorrect"
  }

  assert {
    condition     = strcontains(aws_cloudwatch_log_metric_filter.breakglass_activity.0.pattern, "userName = breakglass* &&")
    error_message = "Default breakglass user name is incorrect"
  }
}

run "custom_identity_names" {
  command = plan

  variables {
    administrator_sso_role_name = "AWSReservedSSO_PlatformAdmin*"
    breakglass_user_name        = "emergency-access"
    tags = {
      team = "security"
    }
  }

  assert {
    condition     = strcontains(aws_cloudwatch_log_metric_filter.admin_sso_activity.0.pattern, "userName = AWSReservedSSO_PlatformAdmin*  &&")
    error_message = "Custom administrator SSO role name not applied to the metric filter"
  }

  assert {
    condition     = strcontains(aws_cloudwatch_log_metric_filter.breakglass_activity.0.pattern, "userName = emergency-access &&")
    error_message = "Custom breakglass user name not applied to the metric filter"
  }
}

run "invalid_identity_name" {
  command = plan

  variables {
    breakglass_user_name = "bad\" || true"
    tags = {
      team = "security"
    }
  }

  expect_failures = [var.breakglass_user_name]
}
