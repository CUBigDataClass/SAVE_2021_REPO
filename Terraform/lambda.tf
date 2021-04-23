/*
AWS Lambda Configuration
*/
resource "aws_lambda_function" "crime" {
  function_name = "crime"
  role          = "arn:aws:iam::558346091212:role/lambda-vpc-role"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  timeout       = 20
  environment {
    variables = {
      database = var.DB_NAME
      host     = local.DB_HOST
      password = var.DB_PASSWORD
      username = var.DB_USERNAME
    }
  }
  vpc_config {
    security_group_ids = [
      "sg-057fbc5b2e2bc6c4e",
      "sg-0776d505b4df0b3c1",
      "sg-0df1c687af03d4389",
      "sg-7127a804",
    ]
    subnet_ids = [
      "subnet-2485334f",
      "subnet-c41d4a88",
      "subnet-d208e4af",
    ]
  }
}

/*
Get Counties Lambda Function
*/
resource "aws_lambda_function" "get_counties" {
  function_name = "get_counties"
  filename      = "lambda_starter.zip"
  role          = aws_iam_role.lambda_default_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  timeout       = 20
  environment {
    variables = {
      database = var.DB_NAME
      host     = local.DB_HOST
      password = var.DB_PASSWORD
      username = var.DB_USERNAME
    }
  }
  vpc_config {
    security_group_ids = [
      "sg-057fbc5b2e2bc6c4e",
      "sg-0776d505b4df0b3c1",
      "sg-0df1c687af03d4389",
      "sg-7127a804",
    ]
    subnet_ids = [
      "subnet-2485334f",
      "subnet-c41d4a88",
      "subnet-d208e4af",
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.lambda_default_role]
}

resource "aws_lambda_permission" "api_gateway_permissions_get_counties" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.get_counties.function_name
   principal     = "apigateway.amazonaws.com"
   source_arn = "${aws_api_gateway_rest_api.main_lambda_gateway.execution_arn}/*/GET/counties"
}


/*
Get County Poverty Rate Lambda Function
*/
resource "aws_lambda_function" "get_county_poverty_rate" {
  function_name = "get_county_poverty_rate"
  filename      = "lambda_starter.zip"
  role          = aws_iam_role.lambda_default_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  timeout       = 20
  environment {
    variables = {
      database = var.DB_NAME
      host     = local.DB_HOST
      password = var.DB_PASSWORD
      username = var.DB_USERNAME
    }
  }
  vpc_config {
    security_group_ids = [
      "sg-057fbc5b2e2bc6c4e",
      "sg-0776d505b4df0b3c1",
      "sg-0df1c687af03d4389",
      "sg-7127a804",
    ]
    subnet_ids = [
      "subnet-2485334f",
      "subnet-c41d4a88",
      "subnet-d208e4af",
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.lambda_default_role]
}

resource "aws_lambda_permission" "api_gateway_permissions_get_county_poverty_rate" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.get_county_poverty_rate.function_name
   principal     = "apigateway.amazonaws.com"
   source_arn = "${aws_api_gateway_rest_api.main_lambda_gateway.execution_arn}/*/GET/counties/*"
}


/*
Get County Crime Count Lambda Function
*/
resource "aws_lambda_function" "get_county_crime_count" {
  function_name = "get_county_crime_count"
  filename      = "lambda_starter.zip"
  role          = aws_iam_role.lambda_default_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  timeout       = 20
  environment {
    variables = {
      database = var.DB_NAME
      host     = local.DB_HOST
      password = var.DB_PASSWORD
      username = var.DB_USERNAME
    }
  }
  vpc_config {
    security_group_ids = [
      "sg-057fbc5b2e2bc6c4e",
      "sg-0776d505b4df0b3c1",
      "sg-0df1c687af03d4389",
      "sg-7127a804",
    ]
    subnet_ids = [
      "subnet-2485334f",
      "subnet-c41d4a88",
      "subnet-d208e4af",
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.lambda_default_role]
}

resource "aws_lambda_permission" "api_gateway_permissions_get_county_crime_count" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.get_county_crime_count.function_name
   principal     = "apigateway.amazonaws.com"
   source_arn = "${aws_api_gateway_rest_api.main_lambda_gateway.execution_arn}/*/GET/counties/*"
}


/*
Get County Income Lambda Function
*/
resource "aws_lambda_function" "get_county_income" {
  function_name = "get_county_income"
  filename      = "lambda_starter.zip"
  role          = aws_iam_role.lambda_default_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  timeout       = 20
  environment {
    variables = {
      database = var.DB_NAME
      host     = local.DB_HOST
      password = var.DB_PASSWORD
      username = var.DB_USERNAME
    }
  }
  vpc_config {
    security_group_ids = [
      "sg-057fbc5b2e2bc6c4e",
      "sg-0776d505b4df0b3c1",
      "sg-0df1c687af03d4389",
      "sg-7127a804",
    ]
    subnet_ids = [
      "subnet-2485334f",
      "subnet-c41d4a88",
      "subnet-d208e4af",
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.lambda_default_role]
}

resource "aws_lambda_permission" "api_gateway_permissions_get_county_income" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.get_county_income.function_name
   principal     = "apigateway.amazonaws.com"
   source_arn = "${aws_api_gateway_rest_api.main_lambda_gateway.execution_arn}/*/GET/counties/*"
}


/*
Get County College Graduate Percent Lambda Function
*/
resource "aws_lambda_function" "get_county_college_graduates" {
  function_name = "get_county_college_graduates"
  filename      = "lambda_starter.zip"
  role          = aws_iam_role.lambda_default_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  timeout       = 20
  environment {
    variables = {
      database = var.DB_NAME
      host     = local.DB_HOST
      password = var.DB_PASSWORD
      username = var.DB_USERNAME
    }
  }
  vpc_config {
    security_group_ids = [
      "sg-057fbc5b2e2bc6c4e",
      "sg-0776d505b4df0b3c1",
      "sg-0df1c687af03d4389",
      "sg-7127a804",
    ]
    subnet_ids = [
      "subnet-2485334f",
      "subnet-c41d4a88",
      "subnet-d208e4af",
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.lambda_default_role]
}

resource "aws_lambda_permission" "api_gateway_permissions_get_county_college_graduates" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.get_county_college_graduates.function_name
   principal     = "apigateway.amazonaws.com"
   source_arn = "${aws_api_gateway_rest_api.main_lambda_gateway.execution_arn}/*/GET/counties/*"
}
