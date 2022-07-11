resource "aws_lakeformation_resource" "s3_company_funding" {
  arn = aws_s3_bucket.bucket01.arn
}

resource "aws_lakeformation_permissions" "s3_company_funding_1" {
  principal   = aws_iam_role.cloudacia_glue_crawler.arn
  permissions = ["DATA_LOCATION_ACCESS"]

  data_location {
    arn = aws_lakeformation_resource.s3_company_funding.arn
  }
}

resource "aws_lakeformation_permissions" "s3_company_funding_2" {
  principal   = aws_iam_role.cloudacia_glue_crawler.arn
  permissions = ["ALL"]

  database {
    name = aws_glue_catalog_database.cloudacia_db_1.name
  }
}
