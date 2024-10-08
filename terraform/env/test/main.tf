terraform {
  required_version = "~> 1.5"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.31.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

// unused provider for while
provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "ingress" {
  source              = "../../modules/nginx-ingress"
  resources_requests  = var.nginx_ingress_resources_requests
  service_annotations = var.nginx_ingress_service_annotations

  providers = {
    helm = helm
  }
}

module "argocd" {
  source                            = "../../modules/argocd"
  argocd_server_admin_password_hash = var.argocd_server_admin_password_hash
  argocd_repo_ssh_key               = var.argocd_repo_ssh_key
  providers = {
    helm = helm
  }

  depends_on = [module.ingress]
}
