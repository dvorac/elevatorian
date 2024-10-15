terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "s3" {
    # provided by -backend-config flags during "terraform init"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      project = "ukol"
    }
  }
}

locals {
  cluster = "ukol"
  app = {
    container_name = "api-container"
    container_port = 3333
  }

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  
}