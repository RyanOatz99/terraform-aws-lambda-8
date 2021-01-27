variable "description" {
  type        = string
  description = "Optional: Description of the lambda function."
  default     = ""
}

variable "environment_vars" {
  type        = map(any)
  description = "Optional: A map with the environment vars. Default to empty map."
  default     = {}
}

variable "function_handler" {
  type        = string
  description = "Lambda function entrypoint."
}

variable "function_memory_size" {
  type        = number
  description = "Optional: Amount of memory allocated to the lambda function, default to 128mb."
  default     = 128
}

variable "function_name" {
  type        = string
  description = "Lambda function name."
}

variable "function_runtime" {
  type        = string
  description = "Lambda choosen runtime."
  validation {
    condition = contains(["nodejs10.x", "nodejs12.x", "java8", "java11", "python3.6",
    "python3.7", "python3.8", "dotnetcore2.1", "dotnetcore3.1", "go1.x", "ruby2.5", "ruby2.7"], var.function_runtime)
    error_message = "The provided runtime is not valid, please check lambda runtime docs."
  }
}

variable "function_zip_path" {
  type        = string
  description = "Optional: Path to zip file with function code."
  default     = ""
}

variable "function_timeout" {
  type        = number
  description = "Optional: Amount of seconds to lambda function timeout."
  default     = 3
}

variable "publish_function_version" {
  type        = bool
  description = "Optional: Publish a version of the lambda function, defaults to false."
  default     = false
}

variable "security_group_ids" {
  type        = list(string)
  description = "Optional: List of security groups ids to place lambda inside a VPC."
  default     = []
}

variable "subnets_ids" {
  type        = list(string)
  description = "Optional: List of subnet ids to place lambda inside a VPC."
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "A map with the tags to apply."
  default     = {}
}

variable "iam_policies" {
  type        = list(string)
  description = "Optional: List of IAM policies arns."
  default     = []
}
