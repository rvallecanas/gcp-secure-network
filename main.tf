terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Consumiendo el módulo oficial de Google para Redes
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.0"

  project_id   = var.project_id
  network_name = "gcp-secure-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-public"
      subnet_ip     = "10.0.1.0/24"
      subnet_region = var.region
    },
    {
      subnet_name           = "subnet-private"
      subnet_ip             = "10.0.2.0/24"
      subnet_region         = var.region
      subnet_private_access = "true" # Permite a las VMs usar servicios de Google sin IP pública
    }
  ]

  firewall_rules = [
    {
      name        = "allow-ssh-ingress"
      direction   = "INGRESS"
      priority    = 1000
      ranges      = ["0.0.0.0/0"] # En producción esto se restringe, pero sirve para el laboratorio
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
    }
  ]
}