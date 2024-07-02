
terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.14.0"
    }
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.nginx_ingress_helm_chart_version

  create_namespace = true
  cleanup_on_fail  = true
  namespace        = "ingress-nginx"

  values = [
    templatefile("${path.module}/templates/values.yaml.tpl", {
      worker_count        = var.worker_count,
      service_annotations = var.service_annotations,
      resources_requests  = var.resources_requests,
    })
  ]
}