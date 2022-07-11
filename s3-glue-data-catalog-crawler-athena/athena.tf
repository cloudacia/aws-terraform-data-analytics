###############################################
#  ATHENA SQL QUERY                          #
###############################################
resource "aws_athena_named_query" "query_1" {
  name     = "query_1"
  database = aws_glue_catalog_database.cloudacia_db_1.name
  query    = "SELECT * FROM ${var.metastore_table_name} limit 20;"
}
