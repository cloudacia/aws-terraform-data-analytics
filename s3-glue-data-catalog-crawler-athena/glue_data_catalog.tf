###############################################
#  GLUE METASTORE DATABASE                    #
###############################################
resource "aws_glue_catalog_database" "cloudacia_db_1" {
  name = var.metastore_db_name
}

resource "aws_glue_crawler" "glue_crawler_1" {
  database_name = aws_glue_catalog_database.cloudacia_db_1.name
  name          = var.glue_crawler_name
  role          = aws_iam_role.cloudacia_glue_crawler.arn

  s3_target {
    path = "s3://${aws_s3_bucket.bucket01.id}"
  }
}

resource "null_resource" "run_crawler" {
  provisioner "local-exec" {
    command = "aws glue start-crawler --name ${aws_glue_crawler.glue_crawler_1.name}"
  }
}
