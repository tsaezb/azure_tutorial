resource "azurerm_kubernetes_cluster_node_pool" "kube1nodepool" {
 for_each               = {for cluster in azurerm_kubernetes_cluster.batchabcd:cluster=>cluster}
 name                   = each.key.name
 kubernetes_cluster_id  = each.key.id
 vm_size                = "Standard_DS2_v2"
 node_count             = 1

  tags = {
    Environment = "Production"
  }
}
