resource "google_compute_instance" "private-instace" {
  name         = "private-instance"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"
  allow_stopping_for_update = true  
  depends_on = [
    google_container_cluster.primary1
   , google_container_node_pool.primary1-node
  ]
  metadata_startup_script = <<-EOF
                                #
                                #install python3
                                sudo apt install python3 -y
                                sudo apt install python3-pip -y
                                #install kubectl
                                sudo mkdir kube_files
                                sudo apt install kubectl -y
                                #install gcloud
                                sudo apt install google-cloud-sdk-gke-gcloud-auth-plugin -y
                                gcloud container clusters get-credentials private-standerd-gke-cluster --zone europe-west1-b
                                #install docker
                                sudo apt-get update
                                sudo apt-get install ca-certificates curl gnupg
                                sudo install -m 0755 -d /etc/apt/keyrings
                                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                                sudo chmod a+r /etc/apt/keyrings/docker.gpg
                                echo \
                                "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
                                $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
                                sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                                sudo apt-get update
                                sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
                                #install git
                                sudo apt install git -y 
                                #install open-jdk
                                sudo apt install java-11-openjdk-devel -y
                                sudo cp -r /root/.config/ /home/tata/
                                sudo chown -R tata:tata /home/tata/.config/
                                sudo cp -r /root/.kube/ /home/tata/
                                sudo chown -R tata:tata /home/tata/.kube/
                                gcloud container clusters get-credentials private-standerd-gke-cluster --zone europe-west1-b
                                gcloud container clusters get-credentials private-standerd-gke-cluster --zone europe-west1-b
                                  EOF


  boot_disk {
    initialize_params {
      image =  "ubuntu-2204-jammy-v20231213a"
      size = 20
    }
  }

  network_interface {
    network = module.network.vpc_name
    subnetwork = module.network.subnet_name
    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    email  = google_service_account.instance-service1.email
    scopes = ["cloud-platform"]
  }
}
output "ip-bastion" {
    value = google_compute_instance.private-instace.network_interface.0.access_config.0.nat_ip
  
}
