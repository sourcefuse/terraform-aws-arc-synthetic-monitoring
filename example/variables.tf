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
  default     = ""
  description = ""
}
variable "sns_topic_name" {
  type        = string
  default     = ""
  description = ""
}
variable "endpoint" {
  type        = string
  default     = ""
  description = ""
}
variable "kms_key_alias" {
  type        = string
  default     = ""
  description = ""
}
