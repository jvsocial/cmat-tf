provider "aws" {
	region     = "us-east-1"
	access_key = " your_aws_access_key_here 2"
	secret_key = "your_aws_secret_key_here"
	token = “your_aws_token_here”
}

locals {
	ingress_rules = [{
		port        = 443
		description = "Port 443"
	},
	{
		port        = 80
		description = "Port 80"
	}]
}

resource "aws_security_group" "main" {
	name   = "foo"
	vpc_id = “your_aws_vpc_id here”

	dynamic "ingress" {
		for_each = local.ingress_rules

		content {
			description = ingress.value.description
			from_port   = ingress.value.port
			to_port     = ingress.value.port
			protocol    = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
	}
	/*
	ingress {
		description = "ajsec bar"
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	*/

	tags = {
		Name = "one security group"
	}
}
