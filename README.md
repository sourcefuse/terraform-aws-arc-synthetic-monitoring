# terraform-aws-arc-synthetic-monitoring

## Overview

SourceFuse AWS Reference Architecture (ARC) Terraform module for managing synthetic canaries.

## Features

- Allows creation of AWS Synthetics canaries with VPC configurations.
- Supports custom IAM roles and policies.
- Flexible configuration options for canaries.

## Usage

To see a full example, check out the [main.tf](./example/main.tf) file in the example folder.  

```hcl
module "this" {
  source = "git::https://github.com/sourcefuse/terraform-aws-refarch-<module_name>"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.4.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0, < 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | sourcefuse/arc-kms/aws | 0.0.4 |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | cloudposse/s3-bucket/aws | 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.canary_in_vpc_alarms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_policy.canary_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.canary_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.canary_execution_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sns_topic.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.my_sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.my_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_synthetics_canary.dynamic_canaries_with_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/synthetics_canary) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_role.execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_enabled"></a> [access\_key\_enabled](#input\_access\_key\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | n/a | `string` | `"private"` | no |
| <a name="input_allow_encrypted_uploads_only"></a> [allow\_encrypted\_uploads\_only](#input\_allow\_encrypted\_uploads\_only) | Set to `true` to prevent uploads of unencrypted objects to S3 bucket | `bool` | `false` | no |
| <a name="input_allowed_bucket_actions"></a> [allowed\_bucket\_actions](#input\_allowed\_bucket\_actions) | n/a | `list(string)` | `[]` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | n/a | `bool` | `false` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | n/a | `bool` | `false` | no |
| <a name="input_bucket_key_enabled"></a> [bucket\_key\_enabled](#input\_bucket\_key\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_canaries_with_vpc"></a> [canaries\_with\_vpc](#input\_canaries\_with\_vpc) | A map of canaries configurations with VPC | `map(any)` | n/a | yes |
| <a name="input_cors_configuration"></a> [cors\_configuration](#input\_cors\_configuration) | n/a | <pre>list(object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    expose_headers  = list(string)<br>    max_age_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_custom_kms_policy"></a> [custom\_kms\_policy](#input\_custom\_kms\_policy) | Custom KMS policy to apply if enabled. If not provided, a default policy will be used. | `string` | `""` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource | `number` | `10` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the KMS module is enabled. If true, a custom KMS key will be used for encryption. If false, the default AWS managed KMS key will be used. | `bool` | `true` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The endpoint for the SNS subscription. | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `bool` | `true` | no |
| <a name="input_kms_key_alias"></a> [kms\_key\_alias](#input\_kms\_key\_alias) | Alias for the custom KMS key (if enabled). | `string` | n/a | yes |
| <a name="input_lifecycle_configuration_rules"></a> [lifecycle\_configuration\_rules](#input\_lifecycle\_configuration\_rules) | n/a | <pre>list(object({<br>    abort_incomplete_multipart_upload_days = number<br>    enabled                                = bool<br>    expiration = object({<br>      days                         = number<br>      expired_object_delete_marker = bool<br>    })<br>    filter_and = object({})<br>    id         = string<br>    noncurrent_version_expiration = object({<br>      newer_noncurrent_versions = number<br>      noncurrent_days           = number<br>    })<br>    noncurrent_version_transition = list(object({}))<br>    transition = list(object({<br>      days          = number<br>      storage_class = string<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "abort_incomplete_multipart_upload_days": 1,<br>    "enabled": true,<br>    "expiration": {<br>      "days": null,<br>      "expired_object_delete_marker": null<br>    },<br>    "filter_and": {},<br>    "id": "delete after 365 days",<br>    "noncurrent_version_expiration": {<br>      "newer_noncurrent_versions": 1,<br>      "noncurrent_days": 1<br>    },<br>    "noncurrent_version_transition": [],<br>    "transition": []<br>  }<br>]</pre> | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol for the SNS subscription endpoint. | `string` | `"email"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | n/a | `bool` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs for the canary | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | Name for the SNS topic. | `string` | n/a | yes |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms` | `string` | `"aws:kms"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs where the canary will run | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the canary | `map(string)` | n/a | yes |
| <a name="input_user_enabled"></a> [user\_enabled](#input\_user\_enabled) | Set to `true` to create an IAM user with permission to access the bucket | `bool` | `false` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_canary_arns"></a> [canary\_arns](#output\_canary\_arns) | ARNs of all canaries created |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning  
This project uses a `.version` file at the root of the repo which the pipeline reads from and does a git tag.  

When you intend to commit to `main`, you will need to increment this version. Once the project is merged,
the pipeline will kick off and tag the latest git commit.  

## Development

### Prerequisites

- [terraform](https://learn.hashicorp.com/terraform/getting-started/install#installing-terraform)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [pre-commit](https://pre-commit.com/#install)
- [golang](https://golang.org/doc/install#install)
- [golint](https://github.com/golang/lint#installation)

### Configurations

- Configure pre-commit hooks
  ```sh
  pre-commit install
  ```

### Versioning

while Contributing or doing git commit please specify the breaking change in your commit message whether its major,minor or patch

For Example

```sh
git commit -m "your commit message #major"
```
By specifying this , it will bump the version and if you don't specify this in your commit message then by default it will consider patch and will bump that accordingly

### Tests
- Tests are available in `test` directory
- Configure the dependencies
  ```sh
  cd test/
  go mod init github.com/sourcefuse/terraform-aws-refarch-<module_name>
  go get github.com/gruntwork-io/terratest/modules/terraform
  ```
- Now execute the test  
  ```sh
  go test -timeout  30m
  ```

## Authors

This project is authored by:
- SourceFuse ARC Team
