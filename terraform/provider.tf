terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.0.0"    
      }
  }
}

provider "aws" {
   region = "us-east-1"
  profile = "default"  # or whatever profile name you used in aws configure
}


