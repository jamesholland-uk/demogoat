resource "aws_elasticsearch_domain" "monitoring-framework" {
  domain_name           = "tg-${var.environment}-es"
  elasticsearch_version = "2.3"

  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    instance_count           = 1
    dedicated_master_enabled = false
    dedicated_master_type    = "m4.large.elasticsearch"
    dedicated_master_count   = 1
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 30
  }

  tags = {
    demo-owner           = "james"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/es.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "1d5a7a80-6161-459e-98e4-aeaf0c33d271"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

data aws_iam_policy_document "policy" {
  statement {
    actions = ["es:*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["*"]
  }
}

resource "aws_elasticsearch_domain_policy" "monitoring-framework-policy" {
  domain_name     = aws_elasticsearch_domain.monitoring-framework.domain_name
  access_policies = data.aws_iam_policy_document.policy.json
}
