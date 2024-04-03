variable "azure_region" {
  description = "azure region"
  type        = string
  default     = "eu-west-2"
}

variable "name" {
  description = "name"
  type        = string
  default     = "app-failover-and-traffic"
}

variable "admin_username" {
  description = "The name of the project"
  type        = string
  default     = "admin"
}

variable "ssh_public_key" {
  description = "The path to the SSH Key File"
  type        = string
}

variable "project" {
  description = "The name of the project"
  type        = string
  default     = "automation-project-one"
}

variable "client" {
  description = "The client for the project"
  type        = string
  default     = "public"
}

variable "owner" {
  description = "The owner of the project"
  type        = string
  default     = "Ovidiu"
}

variable "environment" {
  description = "The project environment"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
}

variable "agents_max_count" {
  description = "The maximum number of nodes in the default node pool"
  type        = number
}

variable "agents_min_count" {
  description = "The minimum number of nodes in the default node pool"
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machines in the default node pool"
  type        = string
}

variable "client_id" {
  description = "The client ID of the service principal"
  type        = string
}

variable "client_secret" {
  description = "The client secret of the service principal"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
  default     = "nodepool1"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "cluster_log_analytics_workspace_name" {
     description = "The name of the existing Log Analytics workspace to use for AKS monitoring."
     type        = string
     default     = null
}

variable "dns_prefix" {
     description = "The prefix to use for naming resources."
     type        = string
     default     = null
}
