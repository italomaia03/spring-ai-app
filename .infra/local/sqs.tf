data "aws_iam_policy_document" "queue" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["s3.amazonaws.com"]
      type = "Service"
    }
    actions = ["sqs:SendMessage"]
    resources = ["arn:aws:sqs:${var.region}:*:${var.queue_name}"]
    condition {
      test     = "ArnEquals"
      values = [aws_s3_bucket.bucket.arn]
      variable = "aws:SourceArn"
    }
  }
}

resource "aws_sqs_queue" "queue" {
  name = var.queue_name
  policy = data.aws_iam_policy_document.queue.json
}