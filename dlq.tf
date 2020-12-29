#DLQ not working currently with Serverless 2.16

resource "aws_sqs_queue" "dlq" {
  name                      = "lambda_dlq"
  max_message_size          = 2048
  message_retention_seconds = 86400
}