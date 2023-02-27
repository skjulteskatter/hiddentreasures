resource "google_cloud_run_service" "sheets" {
  name     = "sheets"
  location = "europe-west4"
}