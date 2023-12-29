resource "google_compute_network" "myvpc" {
  project                 = var.project
  name                    = "myvpc"
  auto_create_subnetworks = false
  mtu                     = var.mtu
}