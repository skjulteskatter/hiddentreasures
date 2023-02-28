module "api_secrets" {
  project = google_project.default.name
  source = "./secrets"
  secrets = {

  }
  secret_accessors = [
    "serviceAccount:${google_service_account.public-api.email}",
  ]
}

module "sheets_secrets" {
  project = google_project.default.name
  source = "./secrets"
  secrets = {

  }
  secret_accessors = [
    "serviceAccount:${google_service_account.sheets-api.email}",
  ]
}

module "directus_secrets" {
  project = google_project.default.name
  source = "./secrets"
  secrets = {

  }
  secret_accessors = [
    "serviceAccount:${google_service_account.directus.email}",
  ]
}