locals {
  canaries_with_vpc = merge([
    for canary in local.canaries : {
      "${canary.name}_canary" = {
        name                     = canary.name
        handler                  = "canary.handler"
        runtime_version          = "syn-python-selenium-3.0"
        schedule_expression      = "rate(2 minutes)"
        failure_retention_period = "361"
        start_canary             = true
        success_retention_period = "361"
        zip_file                 = canary.zip_file
        environment_variables    = canary.environment_variables
        s3_details               = canary.s3_details
      }
    }
  ]...)
}
locals {
  canaries = [
    {
      name = "sourcefuse-canary"
      environment_variables = {}
      zip_file   = null
      # s3_details = null
      s3_details = {
        s3_key = "mayank.zip"
        s3_bucket = "gu-dev-canary-zip-storage"
        s3_version =  null
      }
    },
    {
      name = "sourcefuse-canary-poc"
      environment_variables = {
        "URL" = "https://www.sourcefuse.com/"
      }
      zip_file   = data.archive_file.init.output_path
      s3_details = null
    }
  ]
}
