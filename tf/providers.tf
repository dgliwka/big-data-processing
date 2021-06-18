terraform {
  required_version = ">= 0.12"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.61.0"
    }
  }
}

provider "google" {
  project = "personal-265512"
  region  = "europe-central2"
}
