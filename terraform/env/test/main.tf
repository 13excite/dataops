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
