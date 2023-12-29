resource "google_compute_firewall" "FW" {
  name    = "firewall"
  network = module.network.vpc_name
  project = "eks-cluster-408613"
  source_ranges = ["0.0.0.0/0"]
  depends_on = [  
    module.network
      
    
  ]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

}
