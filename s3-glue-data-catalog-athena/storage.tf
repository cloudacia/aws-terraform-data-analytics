###############################################
#  AWS S3 BUCKET BOOTSTRAPPING EC2            #
###############################################
resource "aws_s3_bucket" "bucket01" {
  bucket = "cloudacia-datasets"
  tags = {
    Name = "Analytics"
  }
}

###############################################
#  AWS UPLOAD FILE TO S3 BUCKET               #
###############################################
resource "aws_s3_object" "object01" {
  bucket = aws_s3_bucket.bucket01.id
  key    = var.dataset_1
  acl    = "private"
  source = "datasets/${var.dataset_1}"
}
