#
# DO NOT DELETE THESE LINES UNTIL INSTRUCTED TO!
#
# Your AMI ID is:
#
#     ami-056db1277deef2218
#
# Your subnet ID is:
#
#     subnet-0ed4f00267a2f569f
#
# Your VPC security group ID is:
#
#     sg-055ae0bd4eabf5e0b
#
# Your Identity is:
#
#     terraform-nyl-camel
#


#resource "aws_instance" "web" {

# ami           = "ami-056db1277deef2218"
#instance_type = "t2.micro"

#subnet_id              = "subnet-0ed4f00267a2f569f"
#vpc_security_group_ids = ["sg-055ae0bd4eabf5e0b"]

#tags = {
# "Identity" = "terraform-nyl-camel"
#}

#}

module "server" {
  source    = "./server"
  server_os = "windows"
  count     = 2
  #ami                    = "ami-056db1277deef2218"
  subnet_id              = "subnet-0ed4f00267a2f569f"
  vpc_security_group_ids = ["sg-055ae0bd4eabf5e0b"]
  #identity               = "terraform-nyl-camel"
  identity    = var.identity
  key_name    = module.keypair.key_name
  private_key = module.keypair.private_key_pem
}

output "public_ip" {
  value     = module.server.*.public_ip
  sensitive = true
}

output "public_dns" {
  value = module.server.*.public_dns
}
module "keypair" {
  source  = "mitchellh/dynamic-keys/aws"
  version = "2.0.0"
  path    = "${path.root}/keys"
  #name    = "terraform-nyl-camel-key"
  name = "${var.identity}.key"
}