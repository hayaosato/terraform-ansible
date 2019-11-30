resource "local_file" "hosts_file" {
  content = <<EOF
[${var.service_name}]
${var.private_ip}
EOF
  filename        = "hosts"
  file_permission = "0644"
}

resource "aws_instance" "default" {
  // ami        = data.aws_ami.recent_centos7.id
  // ami        = data.aws_ami.amazon-linux-2.id
  ami        = data.aws_ami.latest-ubuntu.id
  key_name   = var.key_name
  private_ip = var.private_ip
  count      = 1
  security_groups = var.security_groups
  ]
  subnet_id     = var.subnet_id
  instance_type = "t3.medium"
  tags = {
    Name = "terraform-ansible"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = "10.0.0.59"
      private_key = file("~/.ssh/${var.key_name}.pem")
    }
    inline = [
      "sudo apt install -y python"
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i hosts ${var.service_name}.yml --private-key = ~/.ssh/${var.key_name}.pem"
  }
}
