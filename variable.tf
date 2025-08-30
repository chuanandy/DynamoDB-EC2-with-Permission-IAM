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

variable "yourname" {
  description = "Used to name resources like <yourname>-bookinventory"
  type        = string
  default     = "andyhon_ecddb"
}

variable "ami_id" {
  description = "Amazon Linux 2023 kernel-6.1 AMI"
  type        = string
  default     = "ami-00ca32bbc84273381" # 
}
variable "ssh_ingress_cidr" {
  description = "CIDR allowed to SSH to the instance (for testing)."
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_id" {
  description = "VPC ID to deploy resources into"
  type        = string
}