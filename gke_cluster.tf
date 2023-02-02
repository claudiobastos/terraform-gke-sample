# The Kubernetes's Service Account
resource "google_service_account" "gke-migration-default" {
  account_id   = var.gke_service_account_id
  display_name = "Service Account"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "my-gke-cluster" {
  name     = var.gke_name
  location = var.gcp_zone

  # We can't create a cluster with no node pool defined, but we want to only use separately managed node pools. 
  # So we create the smallest possible default node pool and immediately delete it.

  # It is recommended that node pools be created and managed as separate resources. 
  # This allows node pools to be added and removed without recreating the cluster. 
  # Node pools defined directly in the google_container_cluster resource cannot be removed without re-creating the cluster
  remove_default_node_pool = true
  initial_node_count       = var.gke_num_nodes
}
