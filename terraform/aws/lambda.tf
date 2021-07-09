resource "aws_iam_role" "iam_for_lambda" {
  name = "${local.resource_prefix.value}-analysis-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    demo-owner           = "james"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/lambda.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "3c9e9d95-10da-4886-9221-c6a3d0b3f410"
  }
}

resource "aws_lambda_function" "analysis_lambda" {
  # lambda have plain text secrets in environment variables
  filename      = "resources/lambda_function_payload.zip"
  function_name = "${local.resource_prefix.value}-analysis"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "exports.test"

  source_code_hash = "${filebase64sha256("resources/lambda_function_payload.zip")}"

  runtime = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOSFODNN7EXAMPLE"
      secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
    }
  }

  tags = {
    demo-owner           = "james"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/lambda.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "60d688a6-cc9e-41a6-adcf-03a4ff6b41af"
  }
}