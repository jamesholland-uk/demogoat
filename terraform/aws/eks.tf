locals {
  eks_name = {
    value = "${local.resource_prefix.value}-eks"
  }
}

data aws_iam_policy_document "iam_policy_eks" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource aws_iam_role "iam_for_eks" {
  name               = "${local.resource_prefix.value}-iam-for-eks"
  assume_role_policy = data.aws_iam_policy_document.iam_policy_eks.json

  tags = {
    demo-owner           = "james"
    yor_trace            = "4e2c274e-6bdd-4b1a-a710-8307ca23054a"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/eks.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource aws_iam_role_policy_attachment "policy_attachment-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.iam_for_eks.name
}

resource aws_iam_role_policy_attachment "policy_attachment-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.iam_for_eks.name
}

resource aws_vpc "eks_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    demo-owner           = "james"
    yor_trace            = "2652d82a-7ca3-4728-abf0-2c38996ba7c5"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/eks.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

resource aws_subnet "eks_subnet1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.10.10.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name                                                      = "${local.resource_prefix.value}-eks-subnet"
    "kubernetes.io/cluster/${local.eks_name.value}"           = "shared"
    git_commit                                                = "0468bf147ece4e3f9c72707c02c8bc19aa612071"
    git_file                                                  = "terraform/aws/eks.tf"
    git_last_modified_at                                      = "2021-06-17 14:06:28"
    git_last_modified_by                                      = "eurogig@gmail.com"
    git_modifiers                                             = "eurogig"
    git_org                                                   = "jamesholland-uk"
    git_repo                                                  = "demogoat"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    level                                                     = "production"
    pci-dss                                                   = "true"
    team                                                      = "cloud-eng"
    yor_trace                                                 = "812601e6-90a4-416e-8105-45d6139b0755"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    demo-owner                                                = "james"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$$$${local.eks_name.value}"   = "shared"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$$$$${local.eks_name.value}"  = "shared"
    "kubernetes.io/cluster/$$$$$$$$${local.eks_name.value}"   = "shared"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$$$$$${local.eks_name.value}" = "shared"
    "kubernetes.io/cluster/$$$$$$$$$${local.eks_name.value}"  = "shared"
    "kubernetes.io/cluster/$$$$$$$$${local.eks_name.value}"   = "shared"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
  }
}

resource aws_subnet "eks_subnet2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.10.11.0/24"
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = true
  tags = {
    Name                                                      = "${local.resource_prefix.value}-eks-subnet2"
    "kubernetes.io/cluster/${local.eks_name.value}"           = "shared"
    git_commit                                                = "0468bf147ece4e3f9c72707c02c8bc19aa612071"
    git_file                                                  = "terraform/aws/eks.tf"
    git_last_modified_at                                      = "2021-06-17 14:06:28"
    git_last_modified_by                                      = "eurogig@gmail.com"
    git_modifiers                                             = "eurogig"
    git_org                                                   = "jamesholland-uk"
    git_repo                                                  = "demogoat"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    level                                                     = "production"
    pci-dss                                                   = "true"
    team                                                      = "cloud-eng"
    yor_trace                                                 = "2c310c80-bdae-4c04-a63d-b3a96cda65aa"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    demo-owner                                                = "james"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$$$${local.eks_name.value}"   = "shared"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$$$$${local.eks_name.value}"  = "shared"
    "kubernetes.io/cluster/$$$$$$$$${local.eks_name.value}"   = "shared"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
    "kubernetes.io/cluster/$$$$$$$$$$${local.eks_name.value}" = "shared"
    "kubernetes.io/cluster/$$$$$$$$$${local.eks_name.value}"  = "shared"
    "kubernetes.io/cluster/$$$$$$$$${local.eks_name.value}"   = "shared"
    "kubernetes.io/cluster/$$$$$$$${local.eks_name.value}"    = "shared"
    "kubernetes.io/cluster/$$$$$$${local.eks_name.value}"     = "shared"
    "kubernetes.io/cluster/$$$$$${local.eks_name.value}"      = "shared"
    "kubernetes.io/cluster/$$$$${local.eks_name.value}"       = "shared"
    "kubernetes.io/cluster/$$$${local.eks_name.value}"        = "shared"
    "kubernetes.io/cluster/$$${local.eks_name.value}"         = "shared"
    "kubernetes.io/cluster/$${local.eks_name.value}"          = "shared"
  }
}

resource aws_eks_cluster "eks_cluster" {
  name     = local.eks_name.value
  role_arn = "${aws_iam_role.iam_for_eks.arn}"

  vpc_config {
    endpoint_private_access = true
    subnet_ids              = ["${aws_subnet.eks_subnet1.id}", "${aws_subnet.eks_subnet2.id}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.policy_attachment-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.policy_attachment-AmazonEKSServicePolicy",
  ]

  tags = {
    demo-owner           = "james"
    yor_trace            = "276aac8e-1e15-415f-b101-765492fb04bd"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/eks.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}

output "endpoint" {
  value = "${aws_eks_cluster.eks_cluster.endpoint}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.eks_cluster.certificate_authority.0.data}"
}
