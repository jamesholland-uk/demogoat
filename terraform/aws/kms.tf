resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7

  tags = {
    demo-owner           = "james"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "eaefa900-16e3-4e34-bc53-244a2eafec01"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
