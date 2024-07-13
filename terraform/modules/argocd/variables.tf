variable "argocd_namespace" {
  description = "The namespace in which ArgoCD is deployed."
  type        = string

  default = "argocd"
}

variable "argocd_server_admin_password_hash" {
  description = "The ArgoCD bcrypt hashed admin password."
  type        = string
  sensitive   = true
}
