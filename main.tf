terraform {
  cloud {
    organization = "hallmichaelr"
    workspaces {
      name = "learn-terraform-docker-container"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06464c878dbe46da4"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
