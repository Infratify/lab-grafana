module "grafana_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"

  name          = "grafana"
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.grafana_security_group.security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ansible.key_name
}
