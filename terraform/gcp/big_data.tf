resource google_sql_database_instance "master_instance" {
  name             = "terragoat-${var.environment}-master"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "WWW"
        value = "0.0.0.0/0"
      }
    }
    backup_configuration {
      enabled = false
    }
  }
}

resource google_bigquery_dataset "dataset" {
  dataset_id = "terragoat_${var.environment}_dataset"
  access {
    special_group = "allAuthenticatedUsers"
    role          = "READER"
  }
  labels = {
    demo-owner           = "james"
    git_commit           = "bea73fff3964500456bae8521afa84815c41f921"
    git_file             = "terraform__gcp__big_data_tf"
    git_last_modified_at = "2021-06-17-14-09-33"
    git_last_modified_by = "eurogig"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "01612613-b221-4111-a198-dec10b12ecac"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}