resource "aws_apigatewayv2_route" "route-lambda" {
  count = var.integration_type == "lambda" ? 1 : 0
  api_id =  var.apigw_id
  route_key = format("%s %s",upper(var.method),var.path)
  target    = "integrations/${aws_apigatewayv2_integration.lambda-integration[0].id}"
}
