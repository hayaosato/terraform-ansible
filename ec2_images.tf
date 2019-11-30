// Centos7の最新AMI
// https://letslearndevops.com/2018/08/23/terraform-get-latest-centos-ami/
data "aws_ami" "recent_centos7" {
  most_recent = true
  owners      = ["679593333241"]
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

// Amazon Linuxの最新AMI
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

// Ubuntu18.04の最新AMi
// https://cloud-images.ubuntu.com/locator/ec2/
// 確認コマンド: aws ec2 describe-images  --image-ids ami-0c0f945615e3d22a3
data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
