terraform {
  backend "s3" {
    bucket = "lab-terraformstate-bucket-01"
    key    = "my-kubernetes-advanced-lab-01"
    region = "eu-central-1"
  }
}

# # Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }