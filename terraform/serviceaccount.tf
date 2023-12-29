resource "google_service_account" "instance-service1" {
  account_id = "instance-service1-id"
}

resource "google_service_account_iam_binding" "iam-binding-instance" {
  service_account_id = google_service_account.instance-service1.name
  role               = "roles/admin"  # Use a role appropriate for service accounts

  members = [
    "serviceAccount:${google_service_account.instance-service1.email}",
  ]
}

resource "google_service_account" "cluster-service1" {
  account_id = "cluster-service1-id"
}

resource "google_service_account_iam_binding" "iam-binding-cluster" {
  service_account_id = google_service_account.cluster-service1.name
  role               = "roles/admin"  # Use a role appropriate for service accounts

  members = [
    "serviceAccount:${google_service_account.cluster-service1.email}",
  ]
}
