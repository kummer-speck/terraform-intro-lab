terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "example-vpc"
  }
}

variable "common_cidr_block" {
  type = string
  default = "10.0.30.0/24"
}

# Create a subnet
resource "aws_subnet" "subnet-0" {
  vpc_id     = aws_vpc.example.id
  cidr_block = var.common_cidr_block

  tags = {
    Name = "example-subnet"
  }
}

output "subnet0_id" {
  value = aws_subnet.subnet-0.vpc_id
}