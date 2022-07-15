resource "aws_kms_key" "this" {
  description             = "kms key description"
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.kms-key-policy.json
  deletion_window_in_days = var.key_deletion_window
  tags                    = merge(var.tags, tomap({ "ApplicationComponent" = "kms" }))
}

resource "aws_kms_alias" "alias" {
  name          = format("alias/%s", var.key_name)
  target_key_id = aws_kms_key.this.key_id
}
