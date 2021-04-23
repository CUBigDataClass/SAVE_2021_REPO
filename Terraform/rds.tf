/*
AWS RDS Configuration
*/
/*
variable "DB_HOST" {
  type = string
  description = "Host url for main RDS postgres instance"
}
*/

variable "DB_NAME" {
  type = string
  description = "Name of database in main RDS postgres instance"
}

variable "DB_PASSWORD" {
  type = string
  description = "Password for the main RDS postgres instance"
}

variable "DB_USERNAME" {
  type = string
  description = "Username for the main RDS postgres instance"
}

resource "aws_db_instance" "save-main" {
  allocated_storage                   = 20
  engine                              = "postgres"
  engine_version                      = "12.5"
  instance_class                      = "db.t2.micro"
  name                                = "crime"
  username                            = var.DB_USERNAME
  password                            = var.DB_PASSWORD
  parameter_group_name                = "default.postgres12"
  skip_final_snapshot                 = true
  port                                = 5432
  publicly_accessible                 = true
  storage_encrypted                   = false
  multi_az                            = false
  maintenance_window                  = "wed:10:29-wed:10:59"
  iam_database_authentication_enabled = false
  deletion_protection                 = true
  backup_retention_period             = 7
  availability_zone                   = "us-east-2b"
  copy_tags_to_snapshot               = true
  monitoring_interval                 = 60
  performance_insights_enabled        = true
  tags = {
    workload-type = "other"
  }
}

locals {
  DB_HOST = aws_db_instance.save-main.address
}