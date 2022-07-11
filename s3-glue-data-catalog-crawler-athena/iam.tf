###############################################
#  AWS IAM ROLE FOR EKS WORKERS               #
###############################################
resource "aws_iam_policy" "glue_crawler_s3" {
  name   = "CloudaciaAWSGlueServiceRole"
  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "s3:GetObject",
                  "s3:PutObject"
              ],
              "Resource": [
                  "arn:aws:s3:::${aws_s3_bucket.bucket01.id}*"
              ]
          }
      ]
  }
EOF
}


###############################################
#  AWS IAM ROLE FOR EKS WORKERS               #
###############################################
resource "aws_iam_role" "cloudacia_glue_crawler" {
  name               = "CloudaciaAWSGlueServiceRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
      }
    ]
  }
EOF
}

####################################################
#  ATTACHING POLICY TO A ROLE                      #
####################################################
resource "aws_iam_role_policy_attachment" "cloudacia_glue_crawler_1" {
  role       = aws_iam_role.cloudacia_glue_crawler.name
  policy_arn = aws_iam_policy.glue_crawler_s3.arn
}

####################################################
#  ATTACHING POLICY TO A ROLE                      #
####################################################

resource "aws_iam_role_policy_attachment" "cloudacia_glue_crawler_2" {
  role       = aws_iam_role.cloudacia_glue_crawler.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
