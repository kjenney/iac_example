/*
  First create a user
*/
module "cliuser" {
  source     = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=master"
  namespace  = "terraform"
  stage      = "a"
  name       = "cliuser"
}

/*
  Second create roles and allow user to assume it
*/
resource "aws_iam_role" "prod" {
  name = "prod_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${module.cliuser.user_arn}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role" "stage" {
  name = "stage_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${module.cliuser.user_arn}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}


/*
  Third create the Execution policies
*/
resource "aws_iam_policy" "prod" {
  name        = "prod_policy"
  description = "Assume policy to manage Production"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "ec2:Region": "us-east-1"
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_policy" "stage" {
  name        = "stage_policy"
  description = "Assume policy to manage Staging"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "ec2:Region": "us-east-2"
                }
            }
        }
    ]
}
EOF
}


/*
  Attach Policies to Roles
*/
resource "aws_iam_policy_attachment" "attach-prod" {
  name       = "attach-prod"
  roles      = ["${aws_iam_role.prod.name}"]
  policy_arn = "${aws_iam_policy.prod.arn}"
}

resource "aws_iam_policy_attachment" "attach-stage" {
  name       = "attach-stage"
  roles      = ["${aws_iam_role.stage.name}"]
  policy_arn = "${aws_iam_policy.stage.arn}"
}


/*
  OUTPUT
*/
output "CLI User ARN" {
  value = "${module.cliuser.user_arn}"
}

output "CLI User Access Key" {
  value = "${module.cliuser.access_key_id}"
}

output "CLI User Secret Key" {
  value = "${module.cliuser.secret_access_key}"
}