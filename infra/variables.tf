variable "api_env" {
  type = map(string)
}

variable "directus_env" {
  type = map(string)
}

variable "sheets_env" {
  type = map(string)
}

variable "project_name" {
  type = string
}

variable "sanity_project_id" {
  type = string
}

variable "db" {
  type = object({
    tier              = string
    availability_type = string
    backups_enabled   = bool
  })
}