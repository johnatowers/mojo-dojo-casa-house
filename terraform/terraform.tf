terraform {
  required_version = "1.5.2"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.10.0"
    }
  }
  backend "s3" {
    bucket = "mojo-dojo"
    key = "mojo-dojo-casa-house/terraform/terraform.tfstate"
    region = "us-east-1"
    
  }
}