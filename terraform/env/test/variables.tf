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
  default     = {}

}
