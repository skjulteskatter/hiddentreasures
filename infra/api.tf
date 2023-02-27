resource "google_cloud_run_service" "api" {
  name     = "api"
  location = "europe-west4"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        dynamic "env" {
          for_each = module.api_secrets.data
          iterator = v
          content {
            name = v.value.name
            value_from {
              secret_key_ref {
                key  = v.value.secret_version
                name = v.value.secret_name
              }
            }
          }
        }

        dynamic "env" {
          for_each = var.api_env
          iterator = v
          content {
            name = v.key
            value = v.value
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}