resource "azurerm_user_assigned_identity" "aks_cluster" {
  name                = var.aks_user_assigned_identity_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

# https://learn.microsoft.com/en-us/azure/aks/configure-kubenet#add-role-assignment-for-managed-identity
resource "azurerm_role_assignment" "network_contributor_cluster" {
  scope                = module.avm-res-network-virtualnetwork.resource.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_cluster.principal_id
}

module "aks" {
  source                    = "Azure/aks/azurerm"
  version                   = "9.4.1"
  resource_group_name       = azurerm_resource_group.aks_rg.name
  location                  = azurerm_resource_group.aks_rg.location
  cluster_name              = var.cluster_name
  sku_tier                  = var.sku_tier
  workload_identity_enabled = var.workload_identity_enabled

  agents_pool_name      = var.aks_agents_pool_name
  agents_size           = var.aks_agents_size
  agents_count          = null
  agents_max_pods       = 100
  agents_min_count      = var.aks_agents_node_pool_min_count
  agents_max_count      = var.aks_agents__node_pool_max_count
  agents_pool_max_surge = var.aks_agents_node_pool_max_surge
  agents_tags           = var.tags

  # autoscaler configuration
  auto_scaler_profile_enabled                          = true
  auto_scaler_profile_expander                         = "random"
  auto_scaler_profile_max_graceful_termination_sec     = "180"
  auto_scaler_profile_max_node_provisioning_time       = "5m"
  auto_scaler_profile_max_unready_nodes                = 0
  auto_scaler_profile_scale_down_delay_after_add       = "2m"
  auto_scaler_profile_scale_down_delay_after_delete    = "30s"
  auto_scaler_profile_scale_down_unneeded              = "1m"
  auto_scaler_profile_scale_down_unready               = "2m"
  auto_scaler_profile_scale_down_utilization_threshold = "0.3"

  # cluster level configurations
  api_server_authorized_ip_ranges            = var.aks_connect_authorized_ip_ranges
  create_role_assignment_network_contributor = false
  enable_auto_scaling                        = true
  enable_host_encryption                     = false
  identity_ids                               = [azurerm_user_assigned_identity.aks_cluster.id]
  identity_type                              = "UserAssigned"
  kubernetes_version                         = var.kubernetes_version

  # storage
  storage_profile_blob_driver_enabled         = var.enable_blob_driver
  storage_profile_disk_driver_enabled         = var.enable_disk_driver
  storage_profile_disk_driver_version         = var.disk_driver_version
  storage_profile_file_driver_enabled         = var.enable_file_driver
  storage_profile_snapshot_controller_enabled = var.enable_snapshot_controller
  storage_profile_enabled                     = var.enable_storage_profile

  # network configuration
  network_plugin             = var.network_plugin
  vnet_subnet_id             = module.avm-res-network-virtualnetwork.subnets["dev-eu-aks-subnet"].resource_id
  net_profile_dns_service_ip = var.aks_net_profile_dns_service_ip
  net_profile_service_cidr   = var.aks_net_profile_service_cidr

  admin_username      = var.aks_admin_username
  oidc_issuer_enabled = var.oidc_issuer_enabled
  os_disk_size_gb     = var.disk_size

  # rbac 
  rbac_aad                          = false
  role_based_access_control_enabled = false
  tags                              = var.tags
  prefix                            = var.aks_name_prefix

  log_analytics_workspace_enabled = false
  node_resource_group             = var.aks_node_resource_group

  depends_on = [azurerm_resource_group.aks_rg]
}
