resource "aws_security_group" "eks_sg" {
  name        = "eks-sg"
  description = "EKS Security Group"
  vpc_id      = module.my_vpc.vpc.id  # Referencing VPC ID from the module

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow SSH access
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow HTTPS access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"            # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-sg"
  }
}