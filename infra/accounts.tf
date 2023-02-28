resource "google_service_account" "public-api" {
  account_id = "public-api"
  display_name = "Service account for the Public API"
}

resource "google_service_account" "sheets-api" {
  account_id = "sheets-api"
  display_name = "Service account for the Sheets API"
}

resource "google_service_account" "directus" {
  account_id = "directus"
  display_name = "Service account for Directus"
}