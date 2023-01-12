data "google_project" "project" {
  project_id = var.project_id
}

output "project_number" {
  description = "Project number"
  value       = "${data.google_project.project.number}"
}