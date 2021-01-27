data "archive_file" "dummy" {
  type        = "zip"
  output_path = "${path.module}/files/lambda_function_payload.zip"

  source {
    content  = "dummy-text"
    filename = "dummy.txt"
  }
}

resource "aws_lambda_function" "l" {
  filename      = var.function_zip_path ? var.function_zip_path : data.archive_file.dummy.output_path
  function_name = var.function_name
  handler       = var.function_handler
  role          = aws_iam_role.iam_for_lambda.arn
  runtime       = var.function_runtime

  environment {
    variables = var.environment_vars
  }

  memory_size = var.function_memory_size
  publish     = var.publish_function_version
  timeout     = var.function_timeout

  vpc_config {
    subnet_ids         = var.subnets_ids
    security_group_ids = var.security_group_ids
  }

  tags = var.tags
}
