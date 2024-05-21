variable "aws_default_tags" {
  type        = map(string)
  description = "Default tags to use in AWS resources"
  default     = {
    TeamName = "CD"
  }
}

variable "eks_vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "eks_aws_region" {
  type        = string
  description = "AWS region"
}

variable "eks_vpc_name" {
  type        = string
  description = "VPC name"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "eks_public_api_endpoint_enabled" {
  type        = bool
  description = "Enable public API endpoint"
  default     = true
}

variable "flux_github_url" {
  type    = string
  description = "FluxCD GitHub URL"
  default = "github.com"
}

variable "flux_github_owner" {
  type = string
  description = "FluxCD GitHub owner"
}

variable "flux_github_repository" {
  type = string
  description = "FluxCD GitHub repository"
}

variable "flux_github_branch" {
  type = string
  description = "FluxCD GitHub branch"
  default = "master"
}

variable "flux_github_ssh_user" {
  type = string
  description = "FluxCD GitHub SSH user"
  default = "git"
}

variable "flux_github_repository_ro" {
  type = string
  description = "FluxCD GitHub repository read only"
  default = "false"
}

variable "flux_github_cluster_path" {
  type = string
  description = "FluxCD GitHub cluster path"
}


variable "flux_cluster_domain" {
  type = string
  description = "FluxCD cluster domain"
  default = "cluster.local"
}

variable "flux_components" {
  type = list(string)
  description = "FluxCD components to install"
  default = ["source-controller", "kustomize-controller", "helm-controller", "notification-controller"]
}

variable "flux_components_extra" {
  type = list(string)
  description = "FluxCD additional components to install"
  default = []
}

variable "flux_image_pull_secret" {
  type = string
  description = "FluxCD image pull secret"
  default = null
}

variable "flux_interval" {
  type = string
  description = "FluxCD interval"
  default = "5m0s"
}

variable "flux_kustomization_override" {
  type = string
  description = "FluxCD kustomization override"
  default = null
}

variable "flux_log_level" {
  type = string
  description = "FluxCD log level"
  default = "info"
}

variable "flux_namespace" {
  type = string
  description = "FluxCD namespace"
  default = "flux-system"
}

variable "flux_network_policy" {
  type = bool
  description = "FluxCD network policy"
  default = true
}

variable "flux_recurse_submodules" {
  type = bool
  description = "FluxCD recurse submodules"
  default = false
}

variable "flux_registry" {
  type = string
  description = "FluxCD registry"
  default = "ghcr.io/fluxcd"
}

variable "flux_secret_name" {
  type = string
  description = "FluxCD secret name"
  default = "flux-system"
}

variable "flux_toleration_keys" {
  type = list(string)
  description = "FluxCD toleration keys"
  default = []
}

variable "flux_version" {
  type = string
  description = "FluxCD version"
  default = "v2.3.0"
}

variable "flux_watch_all_namespaces" {
  type = bool
  description = "FluxCD watch all namespaces"
  default = true
}
