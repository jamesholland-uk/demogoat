data google_compute_zones "zones" {}

resource google_compute_instance "server" {
  machine_type = "n1-standard-1"
  name         = "terragoat-${var.environment}-machine"
  zone         = data.google_compute_zones.zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
  can_ip_forward = true

  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
  labels = {
    demo-owner           = "james"
    git_commit           = "bea73fff3964500456bae8521afa84815c41f921"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2021-06-17-14-09-33"
    git_last_modified_by = "eurogig"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "eb453246-823e-4bbb-b4c6-cd81877ff83b"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    demo-owner           = "james"
    git_commit           = "bea73fff3964500456bae8521afa84815c41f921"
    git_file             = "terraform__gcp__instances_tf"
    git_last_modified_at = "2021-06-17-14-09-33"
    git_last_modified_by = "eurogig"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "15c5f730-b040-4f69-967b-d5056f405738"
  }
}