terraform {
  backend "gcs" {
    bucket = "5253ef8e419c95d6-bucket-tfstate"
    prefix = "terraform/state"
  }
}