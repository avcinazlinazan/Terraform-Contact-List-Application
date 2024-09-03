terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "contactlist-backend-naz"
    key = "env/prod/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}


module "contactlist" {
  source   = "../modules"
  git-user = "avcinazlinazan"
  key-name = "anahtarkey"
  hosted-zone = "yagmurana.info"
  env = "prod"
}

output "websiteurl" {
  value = module.contactlist.websiteurl
}