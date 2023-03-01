terraform {
  backend "gcs" {
    bucket = "5253ef8e419c95d6-bucket-tfstate"
    prefix = "terraform/state"
  }
}

#resource "google_project_service" "compute" {
#  project = google_project.default.project_id
#  service = "compute.googleapis.com"
#}