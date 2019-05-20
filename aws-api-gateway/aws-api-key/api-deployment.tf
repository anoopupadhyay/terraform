
resource "aws_api_gateway_api_key" "api_key" {
  name = "spin_api_key"
  description = "Api Key for Spinnaker webhooks generated by terraform armory scripts"
  enabled = true
}
resource "aws_api_gateway_usage_plan" "usage_plan" {
  name                      = "spin_api_usage"
  description  = "Usage plan associated to spinnaker api-key generated by terraform armory scripts"
  api_stages {
    api_id                  = "${var.api_gw_id}"
    stage                   = "${var.stage_name}"
  }
}

resource "aws_api_gateway_usage_plan_key" "usage_plan_key" {
  key_id        = "${aws_api_gateway_api_key.api_key.id}"
  key_type      = "API_KEY"
  usage_plan_id = "${aws_api_gateway_usage_plan.usage_plan.id}"
}