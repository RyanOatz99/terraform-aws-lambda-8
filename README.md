# Terraform module to create Lambda Functions

This terraform module creates a lambda function
with given parameters. You can build the lambda without
the source code or with. 
Check the input variables to see how to configure the module.

## Example

### Without VPC
```hcl
module "my-lambda-function" {
    source            = "git@github.com:lays147/terraform-aws-lambda.git"
    description       = "Description of the lambda function"
    environment_vars  = { 
        env_name  = env_value, 
        env2_name = env2_value,
        ...
    }
    function_handler = "main.handler"
    function_name    = "my-lambda"
    function_runtime = "python3.7"
    tags = {
        Product = "product_name"
        Environment = "development"
    }
}
```

### Within VPC

```hcl
module "my-lambda-function" {
    source            = "git@github.com:lays147/terraform-aws-lambda.git"
    description       = "Description of the lambda function"
    environment_vars  = { 
        env_name  = env_value, 
        env2_name = env2_value,
        ...
    }
    function_handler = "main.handler"
    function_name    = "my-lambda"
    function_runtime = "python3.7"
    tags = {
        Product = "product_name"
        Environment = "development"
    }
    subnets_ids = tolist(data.aws_subnet_ids.selected)
    security_group_ids = [aws_security_group.this.id]
}
```

## Input variables
| name                       | description                                                         | required  |
|----------------------------|---------------------------------------------------------------------|-----------|
|`description`               |Description of the lambda function.                                  | no
|`environment_vars`          |A map with the environment vars. Default to empty map                | no
|`function_handler`          |Lambda function entrypoint                                           | yes
|`function_memory_size`      |Amount of memory allocated to the lambda function, default to 128mb. | no
|`function_name`             |Lambda function name.                                                | yes
|`function_runtime`          |Lambda runtime.                                                      | yes
|`function_timeout`          |Amount of seconds to lambda function timeout.                        | no
|`function_zip_path`         |Path to zip file with function code.                                 | no 
|`publish_function_version`  |Publish a version of the lambda function, defaults to false.         | no
|`security_group_ids`        |List of security groups ids to place lambda inside a VPC.            | no
|`subnets_ids`               |List of subnet ids to place lambda inside a VPC.                     | no 
|`tags`                      |A map with the tags to apply.                                        | no
|`iam_policies`              |List of IAM policies arns                                            | no


## Output variables

| name               | description                             |  
|--------------------|-----------------------------------------|
| `function_arn`     | Arn of the lambda function 
| `function_name`    |  Name of the lambda function
| `function_version` | Last published version of the function
