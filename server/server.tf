#variable ami {}

#data "aws_ami" "ubuntu_16_04" {
# most_recent = true

# filter {
#   name   = "name"
#   values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
# }

# owners = ["099720109477"]
#}

resource "aws_instance" "web" {
  # ami          = var.ami
  #ami           = data.aws_ami.ubuntu.image_id
  #count = var.num_webs
 # ami                    = (var.server_os == "ubuntu") ? data.aws_ami.ubuntu.image_id : data.aws_ami.windows.image_id
 # instance_type          = "t2.micro"
 # subnet_id              = var.subnet_id
 # vpc_security_group_ids = var.vpc_security_group_ids
 # key_name               = var.key_name
  for_each               = var.servers
  #ami                    = each.value.ami
  ami                    = (each.value.server_os == "ubuntu") ? data.aws_ami.ubuntu.image_id : data.aws_ami.windows.image_id
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  tags = {
    "Identity"    = var.identity
    "Name"        = each.key
    "Environment" = "Training"
    #"Name"        = "Student ${count.index + 1}/${var.num_webs}"
  }
}

