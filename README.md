# Account Baseline Alarms

The following repository contains a Terraform module that creates CloudWatch alarms for the AWS account baseline. The alarms are based on the CIS AWS Foundations Benchmark v1.4.0. Notifications for these can be sent to email, Slack and or Microsoft teams.

## Usage

```hcl
module "account_baseline_alarms" {
  source  = "appvia/alarm-baseline/aws"
  version = "0.0.1"

  notification = {
    email = {
      addresses = ["security@example.com"]
    }
  }

  enable_no_mfa_console_signin = true
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 5.0  |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.42.0  |

## Modules

| Name                                                                       | Source                                 | Version |
| -------------------------------------------------------------------------- | -------------------------------------- | ------- |
| <a name="module_notifications"></a> [notifications](#module_notifications) | terraform-aws-modules/sns/aws          | v6.0.1  |
| <a name="module_slack"></a> [slack](#module_slack)                         | terraform-aws-modules/notify-slack/aws | 6.1.1   |

## Resources

| Name                                                                                                                                                                  | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudwatch_log_metric_filter.aws_config_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)       | resource    |
| [aws_cloudwatch_log_metric_filter.cloudtrail_cfg_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)   | resource    |
| [aws_cloudwatch_log_metric_filter.console_signin_failures](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)  | resource    |
| [aws_cloudwatch_log_metric_filter.disable_or_delete_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)    | resource    |
| [aws_cloudwatch_log_metric_filter.iam_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)              | resource    |
| [aws_cloudwatch_log_metric_filter.nacl_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)             | resource    |
| [aws_cloudwatch_log_metric_filter.network_gw_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)       | resource    |
| [aws_cloudwatch_log_metric_filter.no_mfa_console_signin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)    | resource    |
| [aws_cloudwatch_log_metric_filter.organizations_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)    | resource    |
| [aws_cloudwatch_log_metric_filter.root_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)               | resource    |
| [aws_cloudwatch_log_metric_filter.route_table_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)      | resource    |
| [aws_cloudwatch_log_metric_filter.s3_bucket_policy_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource    |
| [aws_cloudwatch_log_metric_filter.security_group_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)   | resource    |
| [aws_cloudwatch_log_metric_filter.unauthorized_api_calls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)   | resource    |
| [aws_cloudwatch_log_metric_filter.vpc_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter)              | resource    |
| [aws_cloudwatch_metric_alarm.aws_config_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)                 | resource    |
| [aws_cloudwatch_metric_alarm.cloudtrail_cfg_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)             | resource    |
| [aws_cloudwatch_metric_alarm.console_signin_failures](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)            | resource    |
| [aws_cloudwatch_metric_alarm.disable_or_delete_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)              | resource    |
| [aws_cloudwatch_metric_alarm.iam_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)                        | resource    |
| [aws_cloudwatch_metric_alarm.nacl_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)                       | resource    |
| [aws_cloudwatch_metric_alarm.network_gw_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)                 | resource    |
| [aws_cloudwatch_metric_alarm.no_mfa_console_signin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)              | resource    |
| [aws_cloudwatch_metric_alarm.organizations_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)              | resource    |
| [aws_cloudwatch_metric_alarm.root_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)                         | resource    |
| [aws_cloudwatch_metric_alarm.route_table_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)                | resource    |
| [aws_cloudwatch_metric_alarm.s3_bucket_policy_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)           | resource    |
| [aws_cloudwatch_metric_alarm.security_group_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)             | resource    |
| [aws_cloudwatch_metric_alarm.unauthorized_api_calls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)             | resource    |
| [aws_cloudwatch_metric_alarm.vpc_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)                        | resource    |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                                         | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)                                                           | data source |

## Inputs

| Name                                                                                                                                       | Description                                                                             | Type                                                                                                                                                                                                                                                                                                                          | Default                             | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- | :------: |
| <a name="input_alarm_namespace"></a> [alarm_namespace](#input_alarm_namespace)                                                             | The cloudwatch alarm namespace.                                                         | `string`                                                                                                                                                                                                                                                                                                                      | `"cis-benchmark"`                   |    no    |
| <a name="input_cloudtrail_log_group_name"></a> [cloudtrail_log_group_name](#input_cloudtrail_log_group_name)                               | The name of the CloudTrail log group to filter on                                       | `string`                                                                                                                                                                                                                                                                                                                      | `"aws-controltower/CloudTrailLogs"` |    no    |
| <a name="input_create_sns_topic"></a> [create_sns_topic](#input_create_sns_topic)                                                          | The boolean flag whether to create the SNS topic for alarms.                            | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_aws_config_changes"></a> [enable_aws_config_changes](#input_enable_aws_config_changes)                               | The boolean flag whether the aws_config_changes alarm is enabled or not.                | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_cloudtrail_cfg_changes"></a> [enable_cloudtrail_cfg_changes](#input_enable_cloudtrail_cfg_changes)                   | The boolean flag whether the cloudtrail_cfg_changes alarm is enabled or not.            | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_console_signin_failures"></a> [enable_console_signin_failures](#input_enable_console_signin_failures)                | The boolean flag whether the console_signin_failures alarm is enabled or not.           | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_disable_or_delete_cmk"></a> [enable_disable_or_delete_cmk](#input_enable_disable_or_delete_cmk)                      | The boolean flag whether the disable_or_delete_cmk alarm is enabled or not.             | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_iam_changes"></a> [enable_iam_changes](#input_enable_iam_changes)                                                    | The boolean flag whether the iam_changes alarm is enabled or not.                       | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_mfa_console_signin_allow_sso"></a> [enable_mfa_console_signin_allow_sso](#input_enable_mfa_console_signin_allow_sso) | The boolean flag whether the no_mfa_console_signin alarm allows SSO auth to be ignored. | `bool`                                                                                                                                                                                                                                                                                                                        | `false`                             |    no    |
| <a name="input_enable_nacl_changes"></a> [enable_nacl_changes](#input_enable_nacl_changes)                                                 | The boolean flag whether the nacl_changes alarm is enabled or not.                      | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_network_gw_changes"></a> [enable_network_gw_changes](#input_enable_network_gw_changes)                               | The boolean flag whether the network_gw_changes alarm is enabled or not.                | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_no_mfa_console_signin"></a> [enable_no_mfa_console_signin](#input_enable_no_mfa_console_signin)                      | The boolean flag whether the no_mfa_console_signin alarm is enabled or not.             | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_organizations_changes"></a> [enable_organizations_changes](#input_enable_organizations_changes)                      | The boolean flag whether the organizations_changes alarm is enabled or not.             | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_root_usage"></a> [enable_root_usage](#input_enable_root_usage)                                                       | The boolean flag whether the root_usage alarm is enabled or not.                        | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_route_table_changes"></a> [enable_route_table_changes](#input_enable_route_table_changes)                            | The boolean flag whether the route_table_changes alarm is enabled or not.               | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_s3_bucket_policy_changes"></a> [enable_s3_bucket_policy_changes](#input_enable_s3_bucket_policy_changes)             | The boolean flag whether the s3_bucket_policy_changes alarm is enabled or not.          | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_security_group_changes"></a> [enable_security_group_changes](#input_enable_security_group_changes)                   | The boolean flag whether the security_group_changes alarm is enabled or not.            | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_unauthorized_api_calls"></a> [enable_unauthorized_api_calls](#input_enable_unauthorized_api_calls)                   | The boolean flag whether the unauthorized_api_calls alarm is enabled or not.            | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_enable_vpc_changes"></a> [enable_vpc_changes](#input_enable_vpc_changes)                                                    | The boolean flag whether the vpc_changes alarm is enabled or not.                       | `bool`                                                                                                                                                                                                                                                                                                                        | `true`                              |    no    |
| <a name="input_notification"></a> [notification](#input_notification)                                                                      | The configuration for how to send notifications.                                        | <pre>object({<br> email = optional(object({<br> addresses = list(string)<br> }), null)<br> slack = optional(object({<br> channel = string<br> lambda_name = optional(string, "alarms-notifications")<br> webhook_url = string<br> }), null)<br> teams = optional(object({<br> webhook_url = string<br> }), null)<br> })</pre> | n/a                                 |   yes    |
| <a name="input_sns_topic_name"></a> [sns_topic_name](#input_sns_topic_name)                                                                | The name of the SNS topic to create for alarms.                                         | `string`                                                                                                                                                                                                                                                                                                                      | `"cis-benchmark-alarms"`            |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                                              | A map of tags to add to all resources.                                                  | `map(string)`                                                                                                                                                                                                                                                                                                                 | n/a                                 |   yes    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->

