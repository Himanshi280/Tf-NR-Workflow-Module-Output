
module "PolicyModule" {
  source      = "./Policy"
  policy-name = var.policy-name
}
module "WorkflowModule" {
  source       = "./Workflow"
  values       = module.PolicyModule.policyId
  notification = var.notification
  workflow     = var.workflow
}