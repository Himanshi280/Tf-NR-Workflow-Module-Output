
data "newrelic_notification_destination" "slack_destination" {
  name = "xyz"
}
resource "newrelic_notification_channel" "notify-channel" {

  name           = var.notification.name
  type           = var.notification.type
  destination_id = data.newrelic_notification_destination.slack_destination.id
  product        = var.notification.product

  property {
    key   = var.notification.key
    value = var.notification.value
  }
  }
resource "newrelic_workflow" "workflow" {
  name                  = var.workflow.name
  muting_rules_handling = var.workflow.muting_rules_handling

  issues_filter {
    name = var.workflow.name1
    type = var.workflow.type

    predicate {
      attribute = var.workflow.attribute
      operator  = var.workflow.operator
      # values    = [newrelic_alert_policy.policy.id]
      values = [var.values]
    }
  }

  destination {
    channel_id            = newrelic_notification_channel.notify-channel.id
    notification_triggers = var.workflow.notification_triggers
  }


}  