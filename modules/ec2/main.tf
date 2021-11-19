data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  security_groups   = [var.sg_name]
  tags              = var.instance_tags
  availability_zone = var.availability_zone
  key_name          = var.key_name


  provisioner "remote-exec" {
    inline = [
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.pem_key_path)
    host        = self.public_ip
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = var.ebs_volume_id
  instance_id = aws_instance.web.id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = var.eip_allocation_id

  provisioner "local-exec" {
    command = "echo 'PUBLIC IP : ${self.public_ip}' >> ip_ec2.txt"
  }
}
