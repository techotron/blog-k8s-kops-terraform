data "aws_caller_identity" "current" {}

terraform {
  backend "s3" {
    bucket = "722777194664-tf-state-eu-west-2"
    key    = "dev/terraform"
    region = "eu-west-2"
  }
}

locals {
  azs                    = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  environment            = "dev"
  kops_state_bucket_name = "${data.aws_caller_identity.current.account_id}-${local.environment}-kops-state-${data.aws_region.current.name}"
  // Needs to be a FQDN
  kubernetes_cluster_name = "kube.esnow.uk"
  ingress_ips             = ["10.0.0.100/32", "10.0.0.101/32", "82.25.28.5/32"]
  vpc_name                = "terraform-k8s-${local.environment}-vpc"

  tags = {
    environment = "${local.environment}"
    terraform   = true
  }
}

data "aws_region" "current" {}
