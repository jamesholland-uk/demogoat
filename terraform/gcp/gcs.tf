resource "google_storage_bucket" "terragoat_website" {
  name          = "terragot-${var.environment}"
  force_destroy = true
  labels = {
    demo-owner           = "james"
    git_commit           = "bea73fff3964500456bae8521afa84815c41f921"
    git_file             = "terraform__gcp__gcs_tf"
    git_last_modified_at = "2021-06-17-14-09-33"
    git_last_modified_by = "eurogig"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "84cb521b-9c2d-4f29-a2f9-e18c58ee825a"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}