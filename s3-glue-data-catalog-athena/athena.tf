###############################################
#  ATHENA SQL QUERY                          #
###############################################
resource "aws_athena_named_query" "query_1" {
  name     = "query_1"
  database = aws_glue_catalog_database.cloudacia_db_1.name
  query    = "SELECT * FROM ${aws_glue_catalog_table.cloudacia_table_1.name} limit 20;"
}
