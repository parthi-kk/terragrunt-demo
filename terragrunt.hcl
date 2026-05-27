remote_state {
  backend = "s3"

  config = {
    bucket = "terragrunt-demo-state-parthi"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "ap-south-2"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"

  contents = <<EOF
provider "aws" {
  region = "ap-south-2"
}
EOF
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite"

  contents = <<EOF
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
EOF
}