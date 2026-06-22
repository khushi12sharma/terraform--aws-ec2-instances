# backend.tf
terraform {
  required_version = ">= 1.1.0"

  cloud {
    organization = "Terraform_test_project_01"   # or use variable

    workspaces {
      name = "terraform--aws-ec2-instances"   # must match TFC workspace
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
