variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Subnet AZ"
  type        = string
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "Amazon Linux 2023 kernel-6.1 AMI"
  type        = string
  default     = "ami-00ca32bbc84273381" # 
}