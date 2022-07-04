output "key_arn" {
  value = aws_kms_key.this.arn
}

output "key_id" {
  value = aws_kms_key.this.id
}

output "key_alias_id" {
  value = aws_kms_alias.alias.arn
}

output "key_alias_arn" {
  value = aws_kms_alias.alias.target_key_arn
}

output "key_policy" {
  value = data.aws_iam_policy_document.kms-key-policy.json
}
