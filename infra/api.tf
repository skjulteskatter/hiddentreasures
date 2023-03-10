resource "google_cloud_run_service" "api" {
  name     = "api"
  location = "europe-west4"

  template {
    spec {
      service_account_name = google_service_account.public-api.email

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

  autogenerate_revision_name = true

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

resource "google_cloud_run_service_iam_policy" "public-api" {
  project     = google_project.default.project_id
  service     = google_cloud_run_service.api.name
  location    = google_cloud_run_service.api.location
  policy_data = data.google_iam_policy.public.policy_data
}

data "google_iam_policy" "public" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
