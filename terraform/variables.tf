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
  default     = "Custom Text"
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

