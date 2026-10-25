terraform {
  backend "s3" {
    bucket  = "kutbuddin2005"
    region  = "us-east-1"
    key     = "kutub/terraform.tfstate" // this to specify any subfolder where you want to store this location 
    encrypt = true
  }
}
