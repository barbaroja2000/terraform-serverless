
resource "aws_ssm_parameter" "endpoint" {
  name        = "/database/${var.name}/endpoint"
  description = "Password for ${var.name} database"
  type        = "SecureString"
  value       = random_string.password.result
}


resource "aws_ssm_parameter" "subnets1" {
  name        = "/serverless/subnets1"
  description = "Subnet1 for serverless"
  type        = "String"
  value       = module.vpc.private_subnets[0]
}

resource "aws_ssm_parameter" "subnets2" {
  name        = "/serverless/subnets2"
  description = "Subnet2 for serverless"
  type        = "String"
  value       =  module.vpc.private_subnets[1]
}


resource "aws_ssm_parameter" "lambda_sg" {
  name        = "/serverless/lambda_sg"
  description = "SG for lambdas"
  type        = "String"
  value       = aws_security_group.altest-lambda-sg.id
}


resource "aws_ssm_parameter" "apigw_endpoint" {
  name        = "/serverless/apigw_endpoints"
  description = "API GW Endpoints for serverless"
  type        = "String"
  value       = module.vpc.vpc_endpoint_apigw_id
}


resource "aws_ssm_parameter" "dlq" {
  name        = "/serverless/dlq"
  description = "DLQ for lambda"
  type        = "String"
  value       = aws_sqs_queue.dlq.arn

}










