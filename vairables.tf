variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "ami_id" {
  description = "AMI ID"
  type        = string
}
variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}
variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
