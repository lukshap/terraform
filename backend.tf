# TF System
terraform {
  required_version = "=0.12.6"
  backend "s3" {
    region = "eu-central-1"
  }
}