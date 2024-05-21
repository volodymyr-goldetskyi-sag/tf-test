module "eks" {
  #source                          = "git::git@github.softwareag.com:IOTA/c8y-tf-eks.git//c8y-eks-cluster"
  source                          = "github.softwareag.com/IOTA/c8y-tf-eks.git//c8y-eks-cluster"
  vpc_cidr                        = var.eks_vpc_cidr
  vpc_name                        = var.eks_vpc_name
  eks_cluster_name                = var.eks_cluster_name
  eks_public_api_endpoint_enabled = var.eks_public_api_endpoint_enabled
  eks_managed_node_groups = {
    default_group = {
      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }
}
