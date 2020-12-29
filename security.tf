resource "aws_security_group" "altest-apigw-sg" {
  description = "Altest Access to API GW via Interface endpoint"
  vpc_id = module.vpc.vpc_id
  name = ""

  lifecycle {
    create_before_destroy = true
  }


  ingress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  //tags          = module.tags.map
}

resource "aws_security_group" "altest-lambda-sg" {
  description = "Altest Access to lambdas"
  vpc_id = module.vpc.vpc_id
  name = ""

  ingress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  //tags          = module.tags.map
}


resource "aws_security_group" "altest-events-sg" {
  description = "Altest Access to Eventbridge"
  vpc_id = module.vpc.vpc_id
  name = ""

  ingress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  //tags          = module.tags.map
}


resource "aws_security_group" "altest-ssm-sg" {
  description = "Altest Access to ssm"
  vpc_id = module.vpc.vpc_id
  name = ""

  ingress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  //tags          = module.tags.map
}















