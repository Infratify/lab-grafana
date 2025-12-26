module "grafana_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "grafana"
  description = "Security group for grafana"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["grafana-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}
