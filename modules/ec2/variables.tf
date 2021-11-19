variable "instance_tags" {
  type = map(string)
  default = {
    Name = "Ec2Instance"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "sg_name" {
  type        = string
  description = "Name of the security group to attach to the instance"
}

variable "ebs_volume_id" {
  type        = string
  description = "ID of the EBS volume to attach to the instance"
}

variable "eip_allocation_id" {
  type        = string
  description = "ID of the created EIP"
}

variable "availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "AZ to put the instance in"
}

variable "pem_key_path" {
  type        = string
  description = "Path to the PEM key to connect to the instance"
}

variable "key_name" {
  type        = string
  description = "Name of the key to provide on the instance"
}
