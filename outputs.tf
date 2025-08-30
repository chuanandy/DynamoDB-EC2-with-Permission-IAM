output "table_name" {
  value = aws_dynamodb_table.bookinventory.name
}

output "policy_name" {
  value = aws_iam_policy.ddb_read_policy.name
}

output "role_name" {
  value = aws_iam_role.ddb_read_role.name
}

output "instance_public_ip" {
  value = aws_instance.demo.public_ip
}

output "test_url" {
  value = "http://${aws_instance.demo.public_ip}/"
}