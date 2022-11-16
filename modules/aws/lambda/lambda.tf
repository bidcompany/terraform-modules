# define lambda function

resource "aws_lambda_function" "lambda" {

  function_name = var.function_name

  s3_bucket = var.bucket
  s3_key = aws_s3_object.lambda.key

  runtime = var.runtime
  handler = var.handler
  timeout = var.timeout
  memory_size = var.memory_size

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  role = var.create_role ?  aws_iam_role.lambda_exec.arn : var.role_arn

  layers = var.layers
  
dynamic "environment" {
    for_each = var.environment_variables
    content {
      variables = environment.value
    }
  }
}
