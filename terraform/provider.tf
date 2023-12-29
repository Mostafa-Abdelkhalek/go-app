terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.10.0"
    }
  }
}
provider "google" {
  project = "eks-cluster-408613"
  region = "europe-west1"
  credentials = "/home/tata/.config/gcloud/legacy_credentials/tata.abdelkhlk815@gmail.com/adc.json"
}