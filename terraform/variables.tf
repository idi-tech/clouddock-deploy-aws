variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  type        = string
  description = "The AZ for the public subnet"
  default     = "us-east-1a"
}

variable "destination_cidr_block" {
  description = "Default route to the Internet"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 Key Pair name"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed to access SSH"
  type        = list(string)
}

variable "allowed_http_cidr" {
  description = "CIDR blocks allowed to access HTTP"
  type        = list(string)
}
