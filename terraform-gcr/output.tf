output "gcr_repo_name" {
    value = google_artifact_registry_repository.myrepo.name
  
}
output "repository_url" {
  value = google_artifact_registry_repository.myrepo.location
}
 