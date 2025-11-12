<!-- markdownlint-disable -->
<a href="https://www.appvia.io/"><img src="./appvia_banner.jpg" alt="Appvia Banner"/></a><br/><p align="right"> <a href="https://registry.terraform.io/modules/appvia/alarm-baseline/aws/latest"><img src="https://img.shields.io/static/v1?label=APPVIA&message=Terraform%20Registry&color=191970&style=for-the-badge" alt="Terraform Registry"/></a></a> <a href="https://github.com/appvia/terraform-aws-alarm-baseline/releases/latest"><img src="https://img.shields.io/github/release/appvia/terraform-aws-alarm-baseline.svg?style=for-the-badge&color=006400" alt="Latest Release"/></a> <a href="https://appvia-community.slack.com/join/shared_invite/zt-1s7i7xy85-T155drryqU56emm09ojMVA#/shared-invite/email"><img src="https://img.shields.io/badge/Slack-Join%20Community-purple?style=for-the-badge&logo=slack" alt="Slack Community"/></a> <a href="https://github.com/appvia/terraform-aws-alarm-baseline/graphs/contributors"><img src="https://img.shields.io/github/contributors/appvia/terraform-aws-alarm-baseline.svg?style=for-the-badge&color=FF8C00" alt="Contributors"/></a>

<!-- markdownlint-restore -->
<!--
  ***** CAUTION: DO NOT EDIT ABOVE THIS LINE ******
-->


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
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | The SNS topic ARN to use for notification | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_alarm_namespace"></a> [alarm\_namespace](#input\_alarm\_namespace) | The cloudwatch alarm namespace. | `string` | `"cis-benchmark"` | no |
| <a name="input_cloudtrail_log_group_name"></a> [cloudtrail\_log\_group\_name](#input\_cloudtrail\_log\_group\_name) | The name of the CloudTrail log group to filter on. | `string` | `"aws-controltower/CloudTrailLogs"` | no |
| <a name="input_enable_administrator_sso_activity"></a> [enable\_administrator\_sso\_activity](#input\_enable\_administrator\_sso\_activity) | The boolean flag whether the administrator\_sso\_activity alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_aws_config_changes"></a> [enable\_aws\_config\_changes](#input\_enable\_aws\_config\_changes) | The boolean flag whether the aws\_config\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_aws_extended_support_alerts"></a> [enable\_aws\_extended\_support\_alerts](#input\_enable\_aws\_extended\_support\_alerts) | The boolean flag whether the eventbridge rules for extended support (EKS/RDS) billing alerts are enabled or not. | `bool` | `true` | no |
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
| <a name="input_enable_unauthorized_api_calls"></a> [enable\_unauthorized\_api\_calls](#input\_enable\_unauthorized\_api\_calls) | The boolean flag whether the unauthorized\_api\_calls alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_enable_vpc_changes"></a> [enable\_vpc\_changes](#input\_enable\_vpc\_changes) | The boolean flag whether the vpc\_changes alarm is enabled or not. | `bool` | `true` | no |
| <a name="input_unauthorized_api_calls_extra_excluded_services"></a> [unauthorized\_api\_calls\_extra\_excluded\_services](#input\_unauthorized\_api\_calls\_extra\_excluded\_services) | Optional list of additional AWS services to exclude from unauthorized API call metric filter. | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
