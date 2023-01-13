data "google_project" "project" {
  project_id = var.project_id
}

output "project_number" {
  description = "Project number"
  value       = "${data.google_project.project.number}"
}

data "google_iam_workload_identity_pool_provider" "provider" {
  provider                           = google-beta
  workload_identity_pool_provider_id = "gh-provider"
  workload_identity_pool_id = "gh-pool"
}

output "provider" {
  description = "Provider id"
  value       = "${data.google_iam_workload_identity_pool_provider.provider.id}"
}
