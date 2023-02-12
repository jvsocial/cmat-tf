locals {
  ami_id = "ami-09e67e426f25ce0d7"
  vpc_id = "vpc-0bcddf970df6059d7"
  ssh_user = "ubuntu"
  key_name = "demokey"
  private_key_path = "demokey.pem"
}

provider "aws" {
region     = "us-east-1" 
 
access_key = "ASIAWBWEOWFPY7OR3MPW" 
 
secret_key = "0kLmrT1a+aWCQv57AuUovak5eUnTfGY7+SytvU9E" 
token = "FwoGZXIvYXdzEFkaDDy0qZqmAuRHx6rrlSK8AUGCQsOfMC6pe9XtdEB4/q10sfeDzHWbT6+nxAzAq3mvpAzVF6w6MbM8K2ogRw8oyoCqUYp8eS73KEccd4oNpMt5TX2o5w/7anW0TTRexaflrw39cie2YupZMCgV7zBfNT2O+8oG698mlb0l5aV3I+ZkexF/PsFDmqoTgBk/hHf2MrL8PStASmqXlv0RDWeasUwFqqmQqsaicNw+drJWKU/SiTu/75klyxIaxF1klzFTwHdXD/U+UybbmWlEKIykop8GMi22n/CzucooHEyIXUmMtWlCsZAfxQ0LgO7w+A612n8+G7L7UotL6m5F1wxl9ds="

}
resource "aws_security_group" "demoaccess" {
	name   = "demoaccess"
	vpc_id = local.vpc_id

  ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
  ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
  egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "web" {
  ami = local.ami_id
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  vpc_security_group_ids =[aws_security_group.demoaccess.id]
  key_name = local.key_name

  tags = {
    Name = "Demo ec2"
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = local.ssh_user
    private_key = file(local.private_key_path)
    timeout = "4m"
  }

  provisioner "remote-exec" {
    inline = [
      "touch /home/ubuntu/demo-file-from-terraform.txt"
    ]
  }
}

