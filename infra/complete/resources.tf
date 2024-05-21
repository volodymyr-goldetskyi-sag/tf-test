resource "tls_private_key" "flux" {
  algorithm = "ECDSA"
  ecdsa_curve = "P256"
}

resource "github_repository_deploy_key" "flux" {
  title = "fluxcd:${reverse(split("/",var.flux_github_cluster_path))[0]}"
  repository = var.flux_github_repository
  key = tls_private_key.flux.public_key_openssh
  read_only = var.flux_github_repository_ro
}

resource "flux_bootstrap_git" "main" {
  depends_on = [module.eks, github_repository_deploy_key.flux]
  path = var.flux_github_cluster_path
  cluster_domain = var.flux_cluster_domain
  components = var.flux_components
  components_extra = var.flux_components_extra
  image_pull_secret = var.flux_image_pull_secret
  interval = var.flux_interval
  kustomization_override = var.flux_kustomization_override
  log_level = var.flux_log_level
  namespace = var.flux_namespace
  network_policy = var.flux_network_policy
  recurse_submodules = var.flux_recurse_submodules
  registry = var.flux_registry
  secret_name = var.flux_secret_name
  toleration_keys = var.flux_toleration_keys
  version = var.flux_version
  watch_all_namespaces = var.flux_watch_all_namespaces
}
