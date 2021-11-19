variable "ebs_size" {
  type    = string
  default = 1
}

variable "ebs_availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "ebs_tags" {
  type = map(string)
  default = {
    "Name" = "LearnTerraformEbs"
  }
}
