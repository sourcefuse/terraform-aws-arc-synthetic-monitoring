module "tags" {
  source  = "sourcefuse/arc-tags/aws"
  version = "1.2.3"

  environment = var.environment
  project     = var.project_name

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/synthetics"
  }
}
module "synthetic-monitoring" {
  source            = "sourcefuse/arc-synthetic-monitoring/aws"
  version           = "0.0.1"
  sns_topic_name    = var.sns_topic_name
  protocol          = var.protocol
  endpoint          = var.endpoint
  kms_key_alias     = var.kms_key_alias
  canaries_with_vpc = local.canaries_with_vpc
  bucket_name       = var.bucket_name
  tags              = module.tags.tags
}
