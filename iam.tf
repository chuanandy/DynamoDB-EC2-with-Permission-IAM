# Trust policy for EC2
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# IAM role for EC2
resource "aws_iam_role" "ddb_read_role" {
  name               = local.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = local.common_tags
}

# ----- Access policy -----
data "aws_iam_policy_document" "ddb_read" {
  # List actions (require *)
  statement {
    sid     = "DynamoDBList"
    effect    = "Allow"
    actions   = ["dynamodb:List*"]
    resources = ["*"]
  }

  # Read actions (scoped to table)
  statement {
    sid    = "DynamoDBReadTable"
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:BatchGetItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:ConditionCheckItem",
      "dynamodb:Describe*"
    ]
    resources = [
      aws_dynamodb_table.bookinventory.arn,
      "${aws_dynamodb_table.bookinventory.arn}/index/*"
    ]
  }
}

resource "aws_iam_policy" "ddb_read_policy" {
  name   = local.policy_name
  description = "List and read access to ${aws_dynamodb_table.bookinventory.name}"
  policy = data.aws_iam_policy_document.ddb_read.json
  tags   = local.common_tags
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ddb_read_role.name
  policy_arn = aws_iam_policy.ddb_read_policy.arn
}

resource "aws_iam_instance_profile" "ddb_read_profile" {
  name = local.instance_profile
  role = aws_iam_role.ddb_read_role.name
  tags = local.common_tags
}
