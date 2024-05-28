################################################################################
## shared
################################################################################
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}
variable "project_name" {
  type        = string
  description = "Name of the project."
  default     = "arc"
}
variable "environment" {
  type        = string
  default     = "poc"
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "bucket_name" {
  type        = string
  default     = "arc-synthetics-poc-three"
  description = "Name of the Bucket"
}
variable "sns_topic_name" {
  type        = string
  default     = "arc-synthetics"
  description = "Name for the SNS topic."
}
variable "endpoint" {
  type        = string
  default     = "mayank2299@gmail.com"
  description = "endpoint for the notifications"
}
variable "protocol" {
  description = "The protocol for the SNS subscription endpoint.it can be http or https or lambda or sqs etc"
  type        = string
  default     = "email"
}
variable "kms_key_alias" {
  type        = string
  default     = "alias/arc-synthetics"
  description = "Alias for the custom KMS key (if enabled)."
}
