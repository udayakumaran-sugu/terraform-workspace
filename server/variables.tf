variable "subnet_id" {}
variable "vpc_security_group_ids" {
  type = list(any)
}
variable "key_name" {}
variable "private_key" {}
variable "server_os" {
  type        = string
  description = "Server Operating System"
  default     = "ubuntu"
}
variable "identity" {
  type        = string
  description = "Server Operating System"
}

variable num_webs {
  default = "2"
}
variable "servers" {
  description = "Map of server types to configuration"
  type        = map(any)
  default = {
    server-iis = {
     # ami                    = (var.server_os == "ubuntu") ? data.aws_ami.ubuntu.image_id : data.aws_ami.windows.image_id
     #ami           = data.aws_ami.ubuntu.image_id
     server_os = "windows"
      instance_type          = "t2.micro",
      environment            = "dev"
      subnet_id              = "subnet-0ed4f00267a2f569f"
      vpc_security_group_ids = ["sg-055ae0bd4eabf5e0b"]
    },
    server-apache = {
      #ami                    = (var.server_os == "ubuntu") ? data.aws_ami.ubuntu.image_id : data.aws_ami.windows.image_id
      #ami           = data.aws_ami.ubuntu.image_id
      server_os = "ubuntu"
      instance_type          = "t2.nano",
      environment            = "test"
      subnet_id              = "subnet-0ed4f00267a2f569f" 
      vpc_security_group_ids = ["sg-055ae0bd4eabf5e0b"]
    }
  }
}
