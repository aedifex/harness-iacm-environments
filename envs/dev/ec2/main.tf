module "ec2" {
  source  = "git::https://github.com/aedifex/harness-iacm-terraform-modules.git//modules/ec2?ref=v2.0.0"
  name    = "Galacticus"
  version = "3.4.4"
}

output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}
