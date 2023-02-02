
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "public-pool" {
  name       = var.gke_pool_name
  location   = var.gcp_zone
  cluster    = google_container_cluster.my-gke-cluster.name
  node_count = var.gke_pool_num_nodes

  node_config {
    # Cost-effective 
    preemptible = true

    # machine types: https://cloud.google.com/compute/docs/general-purpose-machines
    machine_type = var.gke_pool_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke-migration-default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
