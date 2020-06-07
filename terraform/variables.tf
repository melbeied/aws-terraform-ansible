variable "vpc_region" {
     default = "us-east-2"
}
# VPC Config
variable "vpc_name" {
  description = "VPC for case study"
  default     = "WP-VPC"
}

variable "vpc_cidr_block" {
  description = "IP addressing for th VPC"
  default     = "10.0.0.0/22"
}