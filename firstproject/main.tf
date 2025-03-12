module "vpc" {
  source = "/root/DevOps_project/Modules/vpc"
  my_region = "ap-south-1"
  vpc_cidr = "10.0.0.0/16"
  AZ1 = "ap-south-1a"
  AZ2 = "ap-south-1b"
  pub_sub = "10.0.1.0/24"
  pri_sub = "10.0.2.0/24"
  tags = "firstproject"
}