
# GCP Service Account Authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP service account authentication file"
}
# Define GKE project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}
# Define a GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}
# Define GCP project zone
variable "gcp_zone" {
  type        = string
  description = "GCP project zone"
}

variable "gke_service_account_id" {
  default     = "gke-migration-sa"
  description = "gke's service account"
}

variable "gke_name" {
  default     = ""
  description = "gke cluster's name"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "gke_pool_name" {
  default     = "public-pool"
  description = "Nome do pool inicial do cluster"
}

variable "gke_pool_machine_type" {
  # gcloud compute machine-types list --filter=zone=<zone>
  # https://cloud.google.com/compute/docs/general-purpose-machines
  default     = "e2-small"
  description = "Padrão das máquinas criadas no pool"
}

variable "gke_pool_num_nodes" {
  default     = 1
  description = "default start number of nodes in pool"
}

