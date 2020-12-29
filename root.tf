terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    
    }
  }
}

provider "aws" {
    region  = "eu-west-2"
    profile = "al"
}
