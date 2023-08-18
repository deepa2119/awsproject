data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = [var.virtualization_type]
  }

  //owners = ["aws-marketplace"] # Canonical
}
