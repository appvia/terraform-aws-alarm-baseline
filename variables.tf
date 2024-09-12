variable "notification" {
  description = "The configuration for how to send notifications."
  type = object({
    email = optional(object({
      addresses = list(string)
    }), null)
    slack = optional(object({
      lambda_name = optional(string, "alarms-notifications")
      webhook_url = string
    }), null)
    teams = optional(object({
      webhook_url = string
    }), null)
  })
}

variable "enable_administrator_sso_activity" {
  description = "The boolean flag whether the administrator_sso_activity alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_breakglass_activity" {
  description = "The boolean flag whether the breakglass_logins alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_unauthorized_api_calls" {
  description = "The boolean flag whether the unauthorized_api_calls alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_no_mfa_console_signin" {
  description = "The boolean flag whether the no_mfa_console_signin alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_mfa_console_signin_allow_sso" {
  description = "The boolean flag whether the no_mfa_console_signin alarm allows SSO auth to be ignored."
  type        = bool
  default     = false
}

variable "enable_root_usage" {
  description = "The boolean flag whether the root_usage alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_iam_changes" {
  description = "The boolean flag whether the iam_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_cloudtrail_cfg_changes" {
  description = "The boolean flag whether the cloudtrail_cfg_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_console_signin_failures" {
  description = "The boolean flag whether the console_signin_failures alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_disable_or_delete_cmk" {
  description = "The boolean flag whether the disable_or_delete_cmk alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_s3_bucket_policy_changes" {
  description = "The boolean flag whether the s3_bucket_policy_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_aws_config_changes" {
  description = "The boolean flag whether the aws_config_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_security_group_changes" {
  description = "The boolean flag whether the security_group_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_nacl_changes" {
  description = "The boolean flag whether the nacl_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_network_gw_changes" {
  description = "The boolean flag whether the network_gw_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_route_table_changes" {
  description = "The boolean flag whether the route_table_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_vpc_changes" {
  description = "The boolean flag whether the vpc_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "enable_organizations_changes" {
  description = "The boolean flag whether the organizations_changes alarm is enabled or not."
  type        = bool
  default     = true
}

variable "sns_topic_name" {
  description = "The name of the SNS topic to create for alarms."
  type        = string
  default     = "cis-benchmark-alarms"
}

variable "create_sns_topic" {
  description = "The boolean flag whether to create the SNS topic for alarms."
  type        = bool
  default     = true
}

variable "cloudtrail_log_group_name" {
  description = "The name of the CloudTrail log group to filter on."
  type        = string
  default     = "aws-controltower/CloudTrailLogs"
}

variable "alarm_namespace" {
  description = "The cloudwatch alarm namespace."
  type        = string
  default     = "cis-benchmark"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "accounts_id_to_name" {
  description = "A mapping of account id and account name - used by notification lamdba to map an account ID to a human readable name"
  type        = map(string)
  default     = {}
}

variable "cloudwatch_log_group_retention" {
  description = "The retention period for the cloudwatch log group (for lambda function logs) in days"
  type        = string
  default     = "0"
}
