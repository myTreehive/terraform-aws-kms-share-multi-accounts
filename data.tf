data "aws_iam_policy_document" "kms-key-policy" {
  statement {
    sid = "Enable IAM User Permissions"

    actions = [
      "kms:*",
    ]

    resources = ["*"]

    principals {
      identifiers = local.src_list
      type        = "AWS"
    }
  }
  statement {
    sid = "Allow use of the key"

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
      "kms:kms:CreateGrant"
    ]

    resources = ["*"]

    principals {
      identifiers = local.dest_list
      type        = "AWS"
    }
  }

  statement {
    sid = "Allow attachment of persistent resources"

    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]

    resources = ["*"]

    principals {
      identifiers = local.dest_list
      type        = "AWS"
    }

    condition {
      test     = "Bool"
      values   = ["true"]
      variable = "kms:GrantIsForAWSResource"
    }
  }
}