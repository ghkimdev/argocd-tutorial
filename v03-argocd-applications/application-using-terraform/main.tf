# Helm application
resource "argocd_application" "helm" {
  metadata {
    name      = "helm-app-using-terraform"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    source {
      repo_url        = "https://github.com/ghkimdev/argocd-tutorial.git"
      path            = "v03-argocd-applications/helm/nginx"
      target_revision = "main"
      helm {
        value_files = ["custom-values.yaml"]
      }
    }
  }
}
