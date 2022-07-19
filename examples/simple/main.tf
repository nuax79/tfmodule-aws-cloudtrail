locals {
  name        = local.name_prefix
  bucket_name = "${local.name}-s3-trail"
}

module "s3_bucket" {
  source        = "git::https://github.com/nuax79/tfmodule-aws-s3.git"

  bucket_name   = local.bucket_name
  acl           = "log-delivery-write"
  policy        = data.aws_iam_policy_document.default.json
  force_destroy = true
  tags          = merge(local.tags, {Name = local.bucket_name })
}

module "cloudtrail" {
  source          = "../../"

  name            = local.name
  is_multi_region_trail = false
  s3_bucket_name  = module.s3_bucket.bucket_id
  tags            = local.tags
}