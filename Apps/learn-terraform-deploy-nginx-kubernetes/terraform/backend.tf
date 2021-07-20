terraform {
  backend "s3" {
    bucket = "lab-terraformstate-bucket-01"
    key    = "learn-terraform-deploy-nginx-kubernetes"
    region = "eu-central-1"
  }
}