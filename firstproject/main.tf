module "vpc" {
  source = "/root/DevOps_project/Modules/vpc"
  my_region = "ap-south-1"
  vpc_cidr = "100.100.0.0"
  AZ1 = "ap-south-1a"
  AZ2 = "ap-south-1b"
  pub_sub = "100.100.1.1"
  pri_sub = "100.100.2.1"
  tags = "firstproject"
}