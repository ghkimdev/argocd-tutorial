terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.0.3"
    }
  }
}

provider "argocd" {
  server_addr = "localhost:32073"
  username    = var.username
  password    = var.password
  insecure    = true
}
