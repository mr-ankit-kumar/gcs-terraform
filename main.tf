provider "google" {
  project = "qwiklabs-gcp-01-1a9f879cd1bf"
  region  = "us-central1"
}

# Create a GCS bucket
resource "google_storage_bucket" "example_bucket" {
  name          = "qwiklabs-gcp-01-1a9f879cd1bf"
  location      = "us-central1"
  storage_class = "STANDARD"
}

# Copy files from another GCS bucket
resource "null_resource" "copy_files" {
  provisioner "local-exec" {
    command = "gsutil -m cp gs://spls/gsp1153/* gs://qwiklabs-gcp-01-1a9f879cd1bf"
  }
}
