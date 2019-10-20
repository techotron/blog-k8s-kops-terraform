provider "aws" {
  version                   = "~> 2.33"
  region                    = "eu-west-2"
  shared_credentials_file   = "~/.aws/credentials"
  profile                   = "snowco"
}