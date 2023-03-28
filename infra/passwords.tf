resource "random_password" "api_db_password" {
  length  = 64
  special = true
}

resource "random_password" "builder_db_password" {
  length  = 64
  special = true
}

resource "random_password" "directus_db_password" {
  length  = 64
  special = true
}