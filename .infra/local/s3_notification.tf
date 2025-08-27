resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.id

  queue {
    events = ["s3:ObjectCreated:*"]
    queue_arn = aws_sqs_queue.queue.arn
    filter_prefix = "source_files/"
  }
}