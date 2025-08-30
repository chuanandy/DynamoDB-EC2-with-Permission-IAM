resource "aws_dynamodb_table" "bookinventory" {
  name         = local.table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "ISBN"
  range_key = "Genre"

  attribute {
    name = "ISBN"
    type = "S"
  }

  attribute {
    name = "Genre"
    type = "S"
  }

  tags = local.common_tags
}
