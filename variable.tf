variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true  # Mark as sensitive so it's not displayed in the logs
}

variable "aws_region" {
    type = string
}

variable "vpc_cidr" {
    type = string
}

variable "public_subnet_cidr" {
    type = string
}

variable "private_subnet_cidr" {
    type = string
}

variable "key" {
    type = string
}
