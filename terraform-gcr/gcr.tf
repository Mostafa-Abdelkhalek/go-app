resource "google_artifact_registry_repository" "myrepo" {
  location      = var.location
  repository_id = "my-repository"
  description   = "docker repository"
  format        = "DOCKER"
}