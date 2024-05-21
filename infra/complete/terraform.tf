terraform {
  required_version = ">=1.7.0"
  required_providers {
    flux = {
      source = "fluxcd/flux"
      version = ">=1.2"
    }
    github = {
      source = "integrations/github"
      version = ">=6.1"
    }
  }
  #!NOTE: Specified below backend does NOT used by tf-controller and specified for manual/local execution purposes only, tf-controller use backend that specified inside kind:Terraform
  backend "s3" {
    encrypt        = true
    bucket         = "c8ytest-eks-terraform-remote-state-storage-s3"
    region         = "eu-central-1"
    key            = "infrastructure/tfremote/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
