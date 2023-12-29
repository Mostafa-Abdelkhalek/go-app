resource "google_compute_router" "network_router" {
    name = "my-router"
    network = google_compute_network.myvpc.id
    region = google_compute_subnetwork.public-subnet.region
  
}