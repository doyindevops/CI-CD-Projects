
variable "region" {
        default = "us-east-1"
}
variable "vpc_cidr" {
    default = "172.16.0.0/16"
  
}
variable "preferred_number_of_public_subnets" {
  default = null
}