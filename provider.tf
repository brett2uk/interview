# Kubernetes Provider and ionoscloud provider
# ---
# Initial Provider Configuration for Kubernetes and ionos cloud

terraform {

    required_version = ">= 0.13.0"

    required_providers {
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "2.8.0"     
        }
        provider "ionoscloud" {
        version = "~> 6.3.0"
        }
    }
}


