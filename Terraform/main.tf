/*
Main Terraform file for provider
*/
provider "aws" {}

terraform {
  backend "s3" {
    bucket         = "save-cu-terraform-state"
    key            = "save_main/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}
