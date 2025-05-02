################
# Cluster
################
variable "cluster_name" {
  description = "Version of the kubernetes engine"
  default     = "dev-aks-eu"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of the kubernetes engine"
  default     = "1.31"
  type        = string
}

variable "oidc_issuer_enabled" {
  description = "Enable OIDC for the cluster"
  default     = true
  type        = bool
}

variable "log_analytics_workspace_enabled" {
  description = "value to enable log analytics workspace"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_enable_override" {
  description = "Enable overriding of the log analytics workspace name."
  type        = bool
  default     = false
}

variable "cluster_autoscaler_diagnostic_enable_override" {
  description = "Enable overriding of the cluster autoscaler diagnostic setting name."
  type        = bool
  default     = false
}

variable "sku_tier" {
  description = "SKU tier of the cluster. `Free`, `Standard` and `Premium`"
  default     = "Free"
  type        = string
}

################
# Initial Nodepool configurations
################

variable "workload_identity_enabled" {
  description = "Enable workload identity in the cluster"
  default     = true
  type        = bool
}




variable "disk_size" {
  description = "Disk size of the initial node pool in GB"
  default     = "100"
  type        = string
}

variable "aks_admin_username" {
  default     = "aksadmin"
  description = "value of aks admin username"
  type        = string
}

variable "aks_agents_pool_name" {
  default     = "aksystempool"
  description = "value of aks admin username"
  type        = string
}

variable "aks_agents_size" {
  default     = "Standard_B2pls_v2"
  description = "value of aks admin username"
  type        = string
}

variable "aks_agents_node_pool_max_surge" {
  description = "Max surge in percentage for the intial node pool"
  type        = string
  default     = "10"
}

variable "aks_agents_node_pool_min_count" {
  description = "Max count in the initial node pool"
  type        = number
  default     = 1
}

variable "aks_agents__node_pool_max_count" {
  description = "Min count in the initial node pool"
  type        = number
  default     = 2
}

variable "aks_connect_authorized_ip_ranges" {
  description = "Allowed IP ranges to connect to the cluster"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "aks_user_assigned_identity_name" {
  description = "Max surge in percentage for the intial node pool"
  type        = string
  default     = "aks-user-assigned-identity"
}

variable "enable_storage_profile" {
  description = "Enable storage profile for the cluster. If disabled `enable_blob_driver`, `enable_file_driver`, `enable_disk_driver` and `enable_snapshot_controller` will have no impact"
  type        = bool
  default     = true
}

variable "enable_blob_driver" {
  description = "Enable blob storage provider"
  type        = bool
  default     = true
}

variable "enable_file_driver" {
  description = "Enable file storage provider"
  type        = bool
  default     = true
}

variable "enable_disk_driver" {
  description = "Enable disk storage provider"
  type        = bool
  default     = true
}

variable "disk_driver_version" {
  description = "Version of disk driver. Supported values `v1` and `v2`"
  type        = string
  default     = "v1"
}

variable "enable_snapshot_controller" {
  description = "Enable snapshot controller"
  type        = bool
  default     = false
}

variable "network_plugin" {
  description = "Network plugin to use for cluster"
  type        = string
  default     = "azure"

}
variable "aks_net_profile_dns_service_ip" {
  description = "Allowed IP ranges to connect to the cluster"
  type        = string
  default     = "10.0.16.10"
}

variable "aks_net_profile_service_cidr" {
  description = "Allowed IP ranges to connect to the cluster"
  type        = string
  default     = "10.0.16.0/20"
}

variable "aks_name_prefix" {
  description = "Allowed IP ranges to connect to the cluster"
  type        = string
  default     = "demoaks"
}

variable "aks_node_resource_group" {
  description = "Allowed IP ranges to connect to the cluster"
  type        = string
  default     = "rg-aks-nodes"
}
