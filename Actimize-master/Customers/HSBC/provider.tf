provider "aws" {
    region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-demo"
    key    = "Customers/HSBC.tfstate"
    region = "eu-west-2"
  }
}
