data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-role"
  assume_role_policy = "${data.aws_iam_policy_document.instance_assume_role_policy.json}"
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${aws_iam_role.ec2_role.name}"
  role = "${aws_iam_role.ec2_role.name}"
}


