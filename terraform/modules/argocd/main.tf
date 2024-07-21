terraform {
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

resource "helm_release" "argocd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.9.3"

  create_namespace = true
  namespace        = "argocd"

  values = [
    templatefile("${path.module}/templates/values.yaml.tpl", {
      argocd_server_admin_password_hash = var.argocd_server_admin_password_hash
      dataops_repo_ssh_key              = var.argocd_repo_ssh_key
    })
  ]

  lifecycle {
    ignore_changes = [
      metadata
    ]
  }
}
