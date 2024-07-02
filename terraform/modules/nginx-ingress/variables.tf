variable "worker_count" {
  description = "The nginx-ingress worker count"
  type        = number
  default     = 2
}

variable "resources_requests" {
  description = "The resources requests for the nginx-ingress deployment"
  type = object({
    cpu    = string
    memory = string
  })

  default = {
    cpu    = "100m"
    memory = "128Mi"
  }
}

variable "service_annotations" {
  description = "The annotations for the nginx-ingress service"
  type        = map(string)
  default     = {}
}

variable "nginx_ingress_helm_chart_version" {
  description = "The version of the nginx-ingress helm chart"
  type        = string
  default     = "4.10.1"

}
