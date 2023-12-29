output "vpc_name" {
    value = google_compute_network.myvpc.name
  
}
output "subnet_name" {
  value = google_compute_subnetwork.public-subnet.name
}
output "subnet_name_public" {
  value = google_compute_subnetwork.private-subnet.name
}
