variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "(OPTIONAL) type of the instance"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "(OPTIONAL) AWS region to put the instance in"
}

variable "availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "(OPTIONAL) AWS AZ to put the instance in"
}

variable "key_name" {
  type        = string
  description = "(REQUIRED) SSH key to add on the instance"
}

variable "pem_key_path" {
  type        = string
  description = "(REQUIRED) path to the SSH key to use to connect to the instance"
}

