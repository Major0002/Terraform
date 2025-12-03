terraform {
  backend "s3" {
    bucket = "major-terraform-state2026"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}