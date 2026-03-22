module "ec2" {
  source = "git::https://github.com/aedifex/harness-iacm-terraform-modules.git//modules/ec2?ref=main"
  name   = "Galacticus"
}

output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}