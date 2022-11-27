terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.25.2"
    }

    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }

    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }

    archive = {
      source = "hashicorp/archive"
      version = "2.2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}