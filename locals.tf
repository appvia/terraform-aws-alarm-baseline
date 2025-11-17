locals {
  unauthorized_api_calls_base_exclusions = [
    "($.sourceIPAddress != \"delivery.logs.amazonaws.com\")",
    "($.eventName != \"HeadBucket\")"
  ]

  unauthorized_api_calls_extra_exclusions = [
    for svc in var.unauthorized_api_calls_extra_excluded_services :
    "($.eventSource != \"${svc}\")"
  ]

  unauthorized_api_calls_all_exclusions = join(" && ", concat(
    local.unauthorized_api_calls_base_exclusions,
    local.unauthorized_api_calls_extra_exclusions
  ))

  unauthorized_api_calls_filter_pattern = "{(($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\")) && ${local.unauthorized_api_calls_all_exclusions}}"
}
