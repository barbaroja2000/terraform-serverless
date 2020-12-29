module "ec2" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  instance_count = 1

  name          = "test-rig-for-private-api"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[0]
  associate_public_ip_address = false
  iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
}