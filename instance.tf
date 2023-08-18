resource "aws_instance" "myin" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "rsa-key"
  tags = {
    Name = "filetestinstance"
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = 10
  }
  provisioner "file" {
    source = "C:/Users/pyama/Documents/AWSTestProject/startupscript.sh"
    destination = "/home/ec2-user/startupscript.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x startupscript.sh",
      "./startupscript.sh",

    ]
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file(var.private_key_path)
    timeout = "4m"
  }
}

resource "aws_key_pair" "rsa-key" {
  key_name   = "rsa-key"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "rsakey" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "rsa-key"
}