#instances.tf

data "aws_ami" "machine_image_ubuntu" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "tls_private_key" "source" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = var.ssh_key
  public_key = tls_private_key.source.public_key_openssh
}

resource "local_file" "ssh_key" {
  content = tls_private_key.source.private_key_pem
  filename = "${var.ssh_key}.pem"
  file_permission = "0400"
}

resource "aws_instance" "instance" {
  for_each                     = aws_subnet.subnets

  ami                           = data.aws_ami.machine_image_ubuntu.id
  instance_type                 = "t2.micro"
  subnet_id                     = each.value.id
  vpc_security_group_ids        = [aws_security_group.instance_sg.id]
  associate_public_ip_address   = true
  key_name                      = var.ssh_key

  provisioner "local-exec" {
    command = "echo '${self.public_ip}' >> ./host-inventory"
  }
}

resource "null_resource" "ansible-playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook --private-key ${var.ssh_key}.pem main.yml"
  }

  depends_on = [aws_instance.instance]
} 