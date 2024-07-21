variable "environment" {
  type        = string
  description = "The environment name"
}

variable "nginx_ingress_resources_requests" {
  description = "The requests for the ingress pods"
  type = object({
    cpu    = string
    memory = string
  })

  default = {
    cpu    = "100m"
    memory = "128Mi"
  }
}

variable "nginx_ingress_service_annotations" {
  description = "Annotations for the ingress service"
  type        = map(string)

  default = {}
}

variable "argocd_server_admin_password_hash" {
  description = "The ArgoCD bcrypt hashed admin password."
  type        = string
  sensitive   = true
  # hash of "password" password
  default = "$2a$10$zvq2GgaU01tzGX3N8yqSTuFlOXyTMci9FB1avkxo67Ph84vx45lLe"
}

variable "argocd_repo_ssh_key" {
  description = "The SSH Key of dataops repository."
  type        = string
  sensitive   = true
}
