/*
variable "subnet_id" {
  default = ["subnet-03962fde769954c23", "subnet-00314552cf3b2041c", "subnet-04ebf86f25a0de477"]
}

data "aws_ami" "main" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
locals {
  vpc_cidr = {
    prodvpc = "192.168.1.0/24"
    devvpc = "192.168.2.0/24"
    sitvpc = "192.168.3.0/24"
  }
  myvpccidr = ["192.168.1.0/24", "192.168.2.0/24"]
}

resource "aws_vpc" "main" {
  for_each = toset(local.myvpccidr)
  cidr_block = each.value
  tags = {
    Name = each.key
  }
}
resource "aws_instance" "main" {
  count         = length(var.subnet_id)
  ami           = data.aws_ami.main.id
  subnet_id     = var.subnet_id[count.index]
  instance_type = "t2.micro"
  tags          = { Name = "myvm-${count.index}" }
}
*/

//----------------------------------------------------

locals {
  vpc_cidr = "192.168.1.0/24"
}
resource "aws_vpc" "main" {
  cidr_block = local.vpc_cidr
}

/*
data "aws_availability_zones" "main" {
  state = "available"
}
output "az_list" {
  value = data.aws_availability_zones.main.names
}

resource "aws_subnet" "main" {
  count = length(data.aws_availability_zones.main.names)
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(local.vpc_cidr, 2, count.index)
  availability_zone = data.aws_availability_zones.main.names[count.index]
}


resource "aws_subnet" "main" {
  for_each = toset(data.aws_availability_zones.main.names)
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(local.vpc_cidr, 2, index(data.aws_availability_zones.main.names, each.key))
  availability_zone = each.key
}
resource "aws_iam_user" "main" {
  name = "hari"
  depends_on = [ aws_subnet.main ]
}
*/
