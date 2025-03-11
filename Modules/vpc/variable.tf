variable "my_region" {
  type = string
  description = "Name of the region"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR block of VPC"
}

variable "AZ1" {
  type = string
  description =  "Availability Zone 1"
}

variable "AZ2" {
  type = string
  description =  "Availability Zone 2"
}

variable "pub_sub" {
  type = string
  description = "public subnet CIDR block"
}

variable "pri_sub" {
  type = string
  description = "public subnet CIDR block"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = string
  }
