terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "indix-remote-state"
    key    = "ec2-module-test"
    region = "us-east-1"
    dynamodb_table = "indix-locking-remote-state" #partition key <LockID> must and use command <terraform init -reconfigure>
  }
}

#Provide authentication here
provider "aws" {
  region = "us-east-1"
}