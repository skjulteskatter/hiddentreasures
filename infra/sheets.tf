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
}