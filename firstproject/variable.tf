variable "my_region" {
  type = string
  description = "Name of the region"
}

variable "vpc_cidr" {
  type = string
  description = "CIDR block of VPC "
}

variable "AZ1" {
  type = string
  description = "Availabilitiy Zone 1"
}
[
variable "AZ2" {
  type = string
  description = "Availability Zone 2"
}

variable "pub_sub" {
  type = string
  description = "CIDR block for public subnet"
}

variable "pri_sub" {
  type = string
  description = "CIDR block for private subnet"
}

variable "tags" {
  type = string
  description = "Common tags for all resource"
}

variable "cluster_name" {
  default = "eks_cluster_firstproject"
}

variable "key_name" {
  default = "eks-keypair"
}