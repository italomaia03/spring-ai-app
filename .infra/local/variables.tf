variable "region" {
  default = "us-east-1"
  type = string
  description = "aws default region"
}

variable "bucket_name" {
  type = string
  description = "bucket name"
}

variable "queue_name" {
  type = string
  description = "sqs queue name"
}
