resource "google_sql_database_instance" "default" {
  name             = "main-instance"
  database_version = "POSTGRES_13"
  project          = google_project.default.project_id

  settings {
    tier              = var.db.tier
    availability_type = var.db.availability_type

    backup_configuration {
      location                       = "eu"
      enabled                        = var.db.backups_enabled
      // googleapi: Error 400: Invalid request: Point in time recovery must be disabled when backup is disabled., invalid
      point_in_time_recovery_enabled = var.db.backups_enabled
    }

    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "off"
    }

    insights_config {
      query_insights_enabled  = true
      query_string_length     = 4500
      record_application_tags = true
      record_client_address   = false
    }

    maintenance_window {
      day          = 3
      hour         = 2
      update_track = "canary"
    }
  }
}

resource "google_sql_database" "app" {
  name     = "app"
  project  = google_project.default.project_id
  instance = google_sql_database_instance.default.name
}

resource "google_sql_user" "directus" {
  name     = "directus"
  project  = google_project.default.project_id
  instance = google_sql_database_instance.default.name
  password = random_password.directus_db_password.result
  type     = "BUILT_IN"
}

resource "google_sql_user" "api" {
  name     = "api"
  project  = google_project.default.project_id
  instance = google_sql_database_instance.default.name
  password = random_password.api_db_password.result
  type     = "BUILT_IN"
}

resource "google_sql_user" "builder" {
  name     = "builder"
  project  = google_project.default.project_id
  instance = google_sql_database_instance.default.name
  password = random_password.builder_db_password.result
  type     = "BUILT_IN"
}


resource "google_project_iam_binding" "cloudsql-client" {
  project = google_project.default.project_id
  role    = "roles/cloudsql.client"

  members = [
    "serviceAccount:${google_service_account.directus.email}",
    "serviceAccount:${google_service_account.public-api.email}",
  ]
}
