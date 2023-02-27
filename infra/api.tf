resource "google_cloud_run_service" "api" {
  name     = "api"
  location = "europe-west4"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}