resource "google_cloud_run_service" "sheets-api" {
  location = "europe-west4"
  name     = "sheets-api"
  project  = google_project.default.project_id

  metadata {
    namespace = google_project.default.project_id
  }

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "10"
      }
    }

    spec {
      container_concurrency = 200
      service_account_name  = google_service_account.sheets-api.email
      timeout_seconds       = 600

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        dynamic "env" {
          for_each = module.sheets_secrets.data
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
          for_each = var.sheets_env
          iterator = v
          content {
            name = v.key
            value = v.value
          }
        }

        resources {
          limits = {
            "cpu"    = "1000m"
            "memory" = "512Mi"
          }
          requests = {}
        }
      }
    }
  }

  timeouts {}

  autogenerate_revision_name = true

  traffic {
    latest_revision = true
    percent         = 100
  }

  lifecycle {
    ignore_changes = [
      metadata[0].labels,
      metadata[0].annotations,
      template[0].metadata[0].annotations,
      template[0].metadata[0].labels,
      template[0].spec[0].containers[0].image, // The image is managed by the deploy, we just need an initial one
      traffic[0].latest_revision,
      traffic[0].revision_name,
    ]
  }
}