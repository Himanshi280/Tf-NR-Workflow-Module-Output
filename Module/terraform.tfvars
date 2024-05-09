policy-name = "Module-policy"

notification = {
  name    = "slack-notification-channel"
  type    = "SLACK"
  product = "IINT"


  key   = "channelId"
  value = "C071X6N905A"

}

workflow = {
  name                  = "Module_workflow(Output)"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"


  name1 = "Filter-name"
  type  = "FILTER"


  attribute = "labels.policyIds"
  operator  = "EXACTLY_MATCHES"

  notification_triggers = ["ACTIVATED"]

}