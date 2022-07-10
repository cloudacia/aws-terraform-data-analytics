###############################################
#    AWS REGION                               #
###############################################
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

###############################################
#    DATASET CSV                              #
###############################################
variable "dataset_1" {
  type    = string
  default = "company_funding.csv"
}


###############################################
#    METASTORE DB NAME                        #
###############################################
variable "metastore_db_name" {
  type    = string
  default = "cloudacia_sample_data"
}


###############################################
#    METASTORE TABLE NAME                     #
###############################################
variable "metastore_table_name" {
  type    = string
  default = "company_funding"
}
