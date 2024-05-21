provider "aws" {
  default_tags {
    tags = var.aws_default_tags
  }
}

provider "github" {
  base_url = "${var.flux_github_url == "github.com" ? "https://api.github.com/" : "https://${var.flux_github_url}/"}"
  owner = var.flux_github_owner
}

provider "flux" {
  kubernetes = {
    host                   = module.eks.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.eks_cluster_certificate_authority_data)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        var.eks_cluster_name,
      ]
    }
  }
  git = {
    url = "ssh://${var.flux_github_ssh_user}@${var.flux_github_url}/${var.flux_github_owner}/${var.flux_github_repository}.git"
    branch = var.flux_github_branch
    ssh = {
      username = var.flux_github_ssh_user
      private_key = tls_private_key.flux.private_key_pem
    }
  }
}
