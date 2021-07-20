terraform {
  backend "s3" {
    bucket = "lab-terraformstate-bucket-01"
    key    = "my-kubernetes-advanced-lab-01"
    region = "eu-central-1"
  }
}