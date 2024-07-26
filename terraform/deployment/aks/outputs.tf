output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.aks_name
}

output "aks_cluster_id" {
  description = "The ID of the AKS cluster"
  value       = module.aks.aks_id
}

output "host" {
  description = "The host of the AKS cluster"
  value       = module.aks.host
  sensitive   = true
}

output "username" {
  description = "The username of the AKS cluster"
  value       = module.aks.username
  sensitive   = true
}

output "password" {
  description = "The password of the AKS cluster"
  value       = module.aks.password
  sensitive   = true
}

output "client_certificate" {
  description = "The client certificate of the AKS cluster"
  value       = module.aks.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "The client key of the AKS cluster"
  value       = module.aks.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The cluster ca certificate of the AKS cluster"
  value       = module.aks.cluster_ca_certificate
  sensitive   = true
}

