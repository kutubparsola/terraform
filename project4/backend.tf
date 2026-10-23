terraform {
  backend "s3" {
    bucket  = "kutbuddin2005"
    region  = "us-east-1"
    key     = "kutub/terraform.tfstate"
    encrypt = true
  }
}
