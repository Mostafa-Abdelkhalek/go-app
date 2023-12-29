resource "google_compute_subnetwork" "public-subnet" {
  name          = "public-subnet"
  ip_cidr_range = var.public_subnet_cidr_1
  region        = var.region
  network       = google_compute_network.myvpc.id
  private_ip_google_access = true

}
resource "google_compute_subnetwork" "private-subnet" {
  name          = "private-subnet"
  ip_cidr_range = var.private_subnet_cidr_2
  region        = var.region
  network       = google_compute_network.myvpc.id
  private_ip_google_access = true

}