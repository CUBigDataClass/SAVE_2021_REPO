/*
AWS API Gateway Configuration
*/
resource "aws_api_gateway_rest_api" "main_lambda_gateway" {
  name        = "SAVE_MAIN"
  description = "Main API Gateway to Lambda Functions"
}


/*
Top Level '/counties' Endpoint to list all counties
*/
resource "aws_api_gateway_resource" "resource_counties" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_rest_api.main_lambda_gateway.root_resource_id
   path_part   = "counties"
}

resource "aws_api_gateway_method" "method_get_counties" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_counties.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_counties_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_counties.resource_id
   http_method = aws_api_gateway_method.method_get_counties.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_counties.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}


/*
Intermediate resource '/counties/{county}' - No Methods
*/
resource "aws_api_gateway_resource" "resource_county" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_counties.id
   path_part   = "{county}"
}


/*
'/counties/poverty_rate' Endpoint to return poverty rate for all counties
*/
resource "aws_api_gateway_resource" "resource_counties_poverty_rate" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_counties.id
   path_part   = "poverty_rate"
}

resource "aws_api_gateway_method" "method_get_counties_poverty_rate" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_counties_poverty_rate.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_counties_poverty_rate_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_counties_poverty_rate.resource_id
   http_method = aws_api_gateway_method.method_get_counties_poverty_rate.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_poverty_rate.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}

/*
'/counties/{county}/poverty_rate' Endpoint to return poverty rate for a given county
*/
resource "aws_api_gateway_resource" "resource_county_poverty_rate" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_county.id
   path_part   = "poverty_rate"
}

resource "aws_api_gateway_method" "method_get_county_poverty_rate" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_county_poverty_rate.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_county_poverty_rate_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_county_poverty_rate.resource_id
   http_method = aws_api_gateway_method.method_get_county_poverty_rate.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_poverty_rate.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}


/*
'/counties/crime_count' Endpoint to return number of crimes for all counties;
*/
resource "aws_api_gateway_resource" "resource_counties_crime_count" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_counties.id
   path_part   = "crime_count"
}

resource "aws_api_gateway_method" "method_get_counties_crime_count" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_counties_crime_count.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_counties_crime_count_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_counties_crime_count.resource_id
   http_method = aws_api_gateway_method.method_get_counties_crime_count.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_crime_count.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}

/*
'/counties/{county}/crime_count' Endpoint to return number of crimes for a given county;
*/
resource "aws_api_gateway_resource" "resource_county_crime_count" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_county.id
   path_part   = "crime_count"
}

resource "aws_api_gateway_method" "method_get_county_crime_count" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_county_crime_count.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_county_crime_count_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_county_crime_count.resource_id
   http_method = aws_api_gateway_method.method_get_county_crime_count.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_crime_count.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}


/*
'/counties/income' Endpoint to return income for all counties;
*/
resource "aws_api_gateway_resource" "resource_counties_income" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_counties.id
   path_part   = "income"
}

resource "aws_api_gateway_method" "method_get_counties_income" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_counties_income.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_counties_income_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_counties_income.resource_id
   http_method = aws_api_gateway_method.method_get_counties_income.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_income.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}

/*
'/counties/{county}/income' Endpoint to return income for a given county;
*/
resource "aws_api_gateway_resource" "resource_county_income" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_county.id
   path_part   = "income"
}

resource "aws_api_gateway_method" "method_get_county_income" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_county_income.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_county_income_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_county_income.resource_id
   http_method = aws_api_gateway_method.method_get_county_income.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_income.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}


/*
'/counties/college_graduates' Endpoint to return percent college graduates for all counties;
*/
resource "aws_api_gateway_resource" "resource_counties_college_graduates" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_counties.id
   path_part   = "college_graduates"
}

resource "aws_api_gateway_method" "method_get_counties_college_graduates" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_counties_college_graduates.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_counties_college_graduates_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_counties_college_graduates.resource_id
   http_method = aws_api_gateway_method.method_get_counties_college_graduates.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_college_graduates.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}

/*
'/counties/{county}/college_graduates' Endpoint to return percent college_graduates for a given county;
*/
resource "aws_api_gateway_resource" "resource_county_college_graduates" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   parent_id   = aws_api_gateway_resource.resource_county.id
   path_part   = "college_graduates"
}

resource "aws_api_gateway_method" "method_get_county_college_graduates" {
   rest_api_id   = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id   = aws_api_gateway_resource.resource_county_college_graduates.id
   http_method   = "GET"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_county_college_graduates_lambda" {
   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   resource_id = aws_api_gateway_method.method_get_county_college_graduates.resource_id
   http_method = aws_api_gateway_method.method_get_county_college_graduates.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.get_county_college_graduates.invoke_arn
   content_handling        = "CONVERT_TO_TEXT"
}


/*
Deployment Stage for Gateway
*/
resource "aws_api_gateway_deployment" "main_lambda_gateway" {
   depends_on = [
     aws_api_gateway_integration.get_counties_lambda,
     aws_api_gateway_integration.get_county_poverty_rate_lambda,
     aws_api_gateway_integration.get_counties_poverty_rate_lambda,
     aws_api_gateway_integration.get_county_crime_count_lambda,
     aws_api_gateway_integration.get_counties_crime_count_lambda,
     aws_api_gateway_integration.get_county_income_lambda,
     aws_api_gateway_integration.get_counties_income_lambda,
     aws_api_gateway_integration.get_county_college_graduates_lambda,
     aws_api_gateway_integration.get_counties_college_graduates_lambda,
   ]

   rest_api_id = aws_api_gateway_rest_api.main_lambda_gateway.id
   stage_name  = "main"
   //https://github.com/hashicorp/terraform/issues/6613 - Fix to redeploy API on change
   stage_description = md5(file("api_gateway.tf"))
}

output "api_url" {
  value = aws_api_gateway_deployment.main_lambda_gateway.invoke_url
}