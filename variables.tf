variable "ami_name" {
  type        = string
  description = "Name of the ami to search from "
}

variable "virtualization_type" {
  type        = string
  description = "Name of the Virtualization Technology"

}
variable "vpc_cidr_block" {
  type        = string
  description = "Cidr block for the VPC"
}
variable "sub_cidr_block" {
  type        = string
  description = "Cidr block for Subnet"
}

variable "private_key_path" {
  description = "path to private key"
  default = "C:/Users/pyama/Documents/AWSTestProject/rsa-key"
}