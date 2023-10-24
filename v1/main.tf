terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.10"
        }
    }
}

provider "aws" {
    region = "eu-west-2"
}

resource "aws_vpc" "tf_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "vpcOfTerraform"
    }
}

resource "aws_subnet" "tf_vpc_subnet" {
    vpc_id = aws_vpc.tf_vpc.id
    cidr_block = "10.0.1.0/16"

    tags = {
      Name = "Terraform Subnet"
    }
}