resource "google_container_cluster" "primary1" {
  name     = "eks-cluster-1"
  location = "europe-west1-b"
  remove_default_node_pool = true
  initial_node_count       = 1
  network = module.network.vpc_name
  subnetwork = module.network.subnet_name_public

  node_locations = [
    "europe-west1-c"
  ]
    depends_on = [ module.network ]
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.0.1.0/24"
      display_name = "managment-cider-range"
    }
  }
  ip_allocation_policy {
    
  }
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block = "172.16.0.0/28"
  }
}


resource "google_container_node_pool" "primary1-node" {
  name       = "cluster-node"
  cluster    = google_container_cluster.primary1.id
  node_count = 1
  

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.cluster-service1.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }
  
}
