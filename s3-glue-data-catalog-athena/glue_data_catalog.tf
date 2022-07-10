###############################################
#  GLUE METASTORE DATABASE                    #
###############################################

resource "aws_glue_catalog_database" "cloudacia_db_1" {
  name = var.metastore_db_name
}

###############################################
#  GLUE METASTORE TABLE                    #
###############################################
resource "aws_glue_catalog_table" "cloudacia_table_1" {
  name          = var.metastore_table_name
  database_name = aws_glue_catalog_database.cloudacia_db_1.name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    transient_lastDdlTime = "1657471266"
  }


  storage_descriptor {
    location      = "s3://${aws_s3_bucket.bucket01.id}/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"

      parameters = {
        "serialization.format" = ",",
        "field.delim"          = ","
      }
    }

    columns {
      name = "permalink"
      type = "string"
    }

    columns {
      name = "company"
      type = "string"
    }

    columns {
      name = "numEmps"
      type = "int"
    }

    columns {
      name = "category"
      type = "string"
    }

    columns {
      name = "city"
      type = "string"
    }

    columns {
      name = "state"
      type = "string"
    }

    columns {
      name = "fundedDate"
      type = "string"
    }

    columns {
      name = "raisedAmt"
      type = "int"
    }

    columns {
      name = "raisedCurrency"
      type = "string"
    }

    columns {
      name = "round"
      type = "string"
    }
  }
}
