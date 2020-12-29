module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.2.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b"]
  private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]
  apigw_endpoint_private_dns_enabled = true
  apigw_endpoint_security_group_ids = [aws_security_group.altest-apigw-sg.id]
  enable_nat_gateway = false
  enable_apigw_endpoint = true
  enable_vpn_gateway = false
  enable_dns_hostnames = true
  enable_dns_support = true

}

resource "aws_vpc_endpoint" "events" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.eu-west-2.events"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.altest-events-sg.id,
  ]
  subnet_ids = module.vpc.private_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.eu-west-2.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.altest-ssm-sg.id,
  ]
  subnet_ids = module.vpc.private_subnets
  private_dns_enabled = true
}


resource "aws_vpc_endpoint" "ec2_messages" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.eu-west-2.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.altest-ssm-sg.id,
  ]
  subnet_ids = module.vpc.private_subnets
  private_dns_enabled = true
}


resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.eu-west-2.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.altest-ssm-sg.id,
  ]
  subnet_ids = module.vpc.private_subnets
  private_dns_enabled = true
}