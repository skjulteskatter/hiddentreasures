resource "google_storage_bucket" "content" {
  location = "eu"
  name     = "hiddentreasures-content"
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "content-read" {
  bucket = google_storage_bucket.content.name
  member = "allUsers"
  role   = "roles/storage.objectViewer"
}

resource "google_storage_bucket_iam_member" "directus-content" {
  bucket = google_storage_bucket.content.name
  member = "serviceAccount:${google_service_account.directus.email}"
  role   = "roles/storage.objectAdmin"
}