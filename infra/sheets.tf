resource "google_cloud_run_service" "sheets" {
  location = "europe-west4"
  name     = "sheets"
  project  = "hiddentreasures-platform"

  metadata {
    namespace = "hiddentreasures-platform"
  }

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "10"
        "client.knative.dev/user-image"    = "gcr.io/hiddentreasures-platform/sheets:11604a9ea43074fdfad3fe16243a7409d0353c69"
        "run.googleapis.com/client-name"    = "gcloud"
        "run.googleapis.com/client-version" = "419.0.0"
      }
    }

    spec {
      container_concurrency = 200
      service_account_name  = "218099695371-compute@developer.gserviceaccount.com"
      timeout_seconds       = 600

      containers {
        image = "gcr.io/hiddentreasures-platform/sheets:11604a9ea43074fdfad3fe16243a7409d0353c69"

        env {
          name  = "SANITY_PROJECT_ID"
          value = var.sanity_project_id
        }

        env {
          name = "SANITY_TOKEN"

          value_from {
            secret_key_ref {
              key  = "1"
              name = "st-sanity-sheets-token"
            }
          }
        }
        env {
          name = "ST_APITOKEN"

          value_from {
            secret_key_ref {
              key  = "1"
              name = "st-sheets-api-secret"
            }
          }
        }

        ports {
          container_port = 8080
          name           = "http1"
        }

        resources {
          limits = {
            "cpu"    = "2000m"
            "memory" = "512Mi"
          }
          requests = {}
        }
      }
    }
  }

  timeouts {}

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