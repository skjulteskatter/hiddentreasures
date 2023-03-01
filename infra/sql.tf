resource "google_sql_database_instance" "main" {
  name = "hiddentreasures"
  database_version = "POSTGRES_14"
  region = "europe-west4"

  settings {
    tier = "db-f1-micro"
  }
}