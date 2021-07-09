resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = var.neptune-dbname
  engine                              = "neptune"
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = false
  apply_immediately                   = true
  storage_encrypted                   = false

  tags = {
    demo-owner           = "james"
    git_commit           = "0468bf147ece4e3f9c72707c02c8bc19aa612071"
    git_file             = "terraform/aws/neptune.tf"
    git_last_modified_at = "2021-06-17 14:06:28"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "9379b51a-98b0-4e0e-8cb7-944bb4c46d3b"
  }
}

resource "aws_neptune_cluster_instance" "default" {
  count              = 1
  cluster_identifier = aws_neptune_cluster.default.id
  engine             = "neptune"
  instance_class     = "db.t3.medium" # Smallest instance type listed for neptune https://aws.amazon.com/neptune/pricing/
  apply_immediately  = true
  #publicly_accessible                = true # No longer supported, API returns create error. See https://docs.aws.amazon.com/neptune/latest/userguide/api-instances.html#CreateDBInstance

  tags = {
    demo-owner           = "james"
    git_commit           = "0468bf147ece4e3f9c72707c02c8bc19aa612071"
    git_file             = "terraform/aws/neptune.tf"
    git_last_modified_at = "2021-06-17 14:06:28"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "8a1fd72e-c6d4-4f19-a5d7-5af9f08aadf6"
  }
}

resource "aws_neptune_cluster_snapshot" "default" {
  db_cluster_identifier          = aws_neptune_cluster.default.id
  db_cluster_snapshot_identifier = "resourcetestsnapshot1"
}

