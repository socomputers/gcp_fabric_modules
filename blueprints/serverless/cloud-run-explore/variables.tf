variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "Cloud region where resource will be deployed"
  type        = string
  default     = "europe-west1"
}

variable "run_svc_name" {
  description = "Cloud Run service name"
  type        = string
  default     = "hello"
}

variable "image" {
  description = "Container image to deploy"
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "glb_create" {
  description = "Create a Global Load Balancer in front of the Cloud Run service"
  type        = bool
  default     = false
}

variable "custom_domain" {
  description = "Custom domain for the Load Balancer"
  type        = string
  default     = null
}

variable "ingress_settings" {
  description = "Ingress traffic sources allowed to call the service"
  type        = string
  default     = "all"
}

variable "security_policy" {
  description = "Security policy (Cloud Armor) to enforce in the LB"
  type = object({
    enabled      = bool
    ip_blacklist = list(string)
    path_blocked = string
  })
  default = {
    enabled      = false
    ip_blacklist = null
    path_blocked = null
  }
}

variable "iap" {
  description = "Identity-Aware Proxy for Cloud Run in the LB"
  type = object({
    enabled            = bool
    support_email      = string
    app_title          = string
    oauth2_client_name = string
  })
  default = {
    enabled            = false
    support_email      = null
    app_title          = null
    oauth2_client_name = null
  }
}
