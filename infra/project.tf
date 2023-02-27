resource "google_project" "default" {
  name            = "HiddenTreasures Platform"
  project_id      = var.project_name
  org_id          = "739000490259"
  billing_account = "018E53-95C40C-51333B"
}