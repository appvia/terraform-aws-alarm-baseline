variable "sns_topic_arn" {
  description = "The SNS topic ARN to use for notification"
  type        = string
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

variable "enable_aws_extended_support_alerts" {
  description = "The boolean flag whether the eventbridge rules for extended support (EKS/RDS) billing alerts are enabled or not."
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

variable "unauthorized_api_calls_extra_excluded_services" {
  description = "Optional list of additional AWS services to exclude from unauthorized API call metric filter."
  type        = list(string)
  default     = []

  validation {
    condition = alltrue([
      alltrue([
        for svc in var.unauthorized_api_calls_extra_excluded_services :
        can(regex("^([a-z0-9-]+)\\.amazonaws\\.com$", svc))
      ]),
      length(join(",", var.unauthorized_api_calls_extra_excluded_services)) < 1000
    ])

    error_message = "Each excluded service must be a valid AWS service domain (e.g. inspector2.amazonaws.com) and total list length must not exceed 500 characters."
  }
}
