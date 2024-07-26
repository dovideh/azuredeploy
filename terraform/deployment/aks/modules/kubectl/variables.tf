variable "cluster_config" {
  description = "AKS Cluster Config"
  type        = object({
    host      = string
    client_key = string
    client_certificate = string
    cluster_ca_certificate = string
  })
}

