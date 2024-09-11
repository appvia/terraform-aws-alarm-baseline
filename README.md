![Github Actions](../../actions/workflows/terraform.yml/badge.svg)

# Terraform AWS Account Baseline Alarms

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

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_notifications"></a> [notifications](#module\_notifications) | appvia/notifications/aws | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.admin_sso_activity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.aws_config_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.breakglass_activity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.cloudtrail_cfg_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.console_signin_failures](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.disable_or_delete_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.iam_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.nacl_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.network_gw_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.no_mfa_console_signin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.organizations_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.root_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.route_table_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.s3_bucket_policy_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.security_group_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.unauthorized_api_calls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.vpc_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.admin_sso_activity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.aws_config_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.breakglass_activity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cloudtrail_cfg_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.console_signin_failures](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.disable_or_delete_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.iam_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.nacl_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.network_gw_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.no_mfa_console_signin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.organizations_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.root_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.route_table_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.s3_bucket_policy_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.security_group_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.unauthorized_api_calls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.vpc_changes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accounts_id_to_name"></a> [accounts\_id\_to\_name](#input\_accounts\_id\_to\_name) | A mapping of account id and account name - used by notification lamdba to map an account ID to a human readable name | `map(string)` | n/a | yes |
| <a name="input_notification"></a> [notification](#input\_notification) | The configuration for how to send notifications. | <pre>object({<br>    email = optional(object({<br>      addresses = list(string)<br>    }), null)<br>    slack = optional(object({<br>      lambda_name = optional(string, "alarms-notifications")<br>      webhook_url = string<br>    }), null)<br>    teams = optional(object({<br>      webhook_url = string<br>    }), null)<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_alarm_namespace"></a> [alarm\_namespace](#input\_alarm\_namespace) | The cloudwatch alarm namespace. | `string` | `"cis-benchmark"` | no |
| <a name="input_cloudtrail_log_group_name"></a> [cloudtrail\_log\_group\_name](#input\_cloudtrail\_log\_group\_name) | The name of the CloudTrail log group to filter on. | `string` | `"aws-controltower/CloudTrailLogs"` | no |
| <a name="input_create_sns_topic"></a> [create\_sns\_topic](#input\_create\_sns\_topic) | The boolean flag whether to create the SNS topic for alarms. | `bool` | `true` | no |
| <a name="input_enable_administrator_sso_activity"></a> [enable\_administrator\_sso\_activity](#input\_enable\_administrator\_sso\_activity) | The boolean flag whether the administrator\_sso\_activity alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_aws_config_changes"></a> [enable\_aws\_config\_changes](#input\_enable\_aws\_config\_changes) | The boolean flag whether the aws\_config\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_breakglass_activity"></a> [enable\_breakglass\_activity](#input\_enable\_breakglass\_activity) | The boolean flag whether the breakglass\_logins alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_cloudtrail_cfg_changes"></a> [enable\_cloudtrail\_cfg\_changes](#input\_enable\_cloudtrail\_cfg\_changes) | The boolean flag whether the cloudtrail\_cfg\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_console_signin_failures"></a> [enable\_console\_signin\_failures](#input\_enable\_console\_signin\_failures) | The boolean flag whether the console\_signin\_failures alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_disable_or_delete_cmk"></a> [enable\_disable\_or\_delete\_cmk](#input\_enable\_disable\_or\_delete\_cmk) | The boolean flag whether the disable\_or\_delete\_cmk alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_iam_changes"></a> [enable\_iam\_changes](#input\_enable\_iam\_changes) | The boolean flag whether the iam\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_mfa_console_signin_allow_sso"></a> [enable\_mfa\_console\_signin\_allow\_sso](#input\_enable\_mfa\_console\_signin\_allow\_sso) | The boolean flag whether the no\_mfa\_console\_signin alarm allows SSO auth to be ignored. | `bool` | `false` | no |
| <a name="input_enable_nacl_changes"></a> [enable\_nacl\_changes](#input\_enable\_nacl\_changes) | The boolean flag whether the nacl\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_network_gw_changes"></a> [enable\_network\_gw\_changes](#input\_enable\_network\_gw\_changes) | The boolean flag whether the network\_gw\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_no_mfa_console_signin"></a> [enable\_no\_mfa\_console\_signin](#input\_enable\_no\_mfa\_console\_signin) | The boolean flag whether the no\_mfa\_console\_signin alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_organizations_changes"></a> [enable\_organizations\_changes](#input\_enable\_organizations\_changes) | The boolean flag whether the organizations\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_root_usage"></a> [enable\_root\_usage](#input\_enable\_root\_usage) | The boolean flag whether the root\_usage alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_route_table_changes"></a> [enable\_route\_table\_changes](#input\_enable\_route\_table\_changes) | The boolean flag whether the route\_table\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_s3_bucket_policy_changes"></a> [enable\_s3\_bucket\_policy\_changes](#input\_enable\_s3\_bucket\_policy\_changes) | The boolean flag whether the s3\_bucket\_policy\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_security_group_changes"></a> [enable\_security\_group\_changes](#input\_enable\_security\_group\_changes) | The boolean flag whether the security\_group\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Enable/disable the posting of notifications to slack | `bool` | `true` | no |
| <a name="input_enable_unauthorized_api_calls"></a> [enable\_unauthorized\_api\_calls](#input\_enable\_unauthorized\_api\_calls) | The boolean flag whether the unauthorized\_api\_calls alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_vpc_changes"></a> [enable\_vpc\_changes](#input\_enable\_vpc\_changes) | The boolean flag whether the vpc\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | The name of the SNS topic to create for alarms. | `string` | `"cis-benchmark-alarms"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | The ARN of the SNS topic |
<!-- END_TF_DOCS -->
