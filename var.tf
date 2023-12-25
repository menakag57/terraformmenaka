variable aws_region {
  type        = string
  description = "region"
  default     = "us-east-1"
}
#CIDR
variable cidr_vpc {
  type        = string
  description = "cidr"
  default     = "10.0.0.0/16" #65536
}
#pubsub-1
variable subpub1 {
  type        = string
  description = "cidr"
  default     = "10.0.1.0/24" #256
}

#pubsub-2
variable subpub2 {
  type        = string
  description = "cidr"
  default     = "10.0.2.0/24" #256
}
#pvtsub-1
variable subpvt1 {
  type        = string
  description = "cidr"
  default     = "10.0.3.0/24" #256
}

#pvtsub-2
variable subpvt2 {
  type        = string
  description = "cidr"
  default     = "10.0.4.0/24" #256
}

#az-pub-1
variable az_sub_pub1 {
  type        = string
  description = "cidr"
  default     = "us-east-1a" 
}
#az-pub-2
variable az_sub_pub2 {
  type        = string
  description = "cidr"
  default     = "us-east-1b" 
}

#az-pvt-1
variable az_sub_pvt1 {
  type        = string
  description = "cidr"
  default     = "us-east-1a" 
}
#az-pvt-2
variable az_sub_pvt2 {
  type        = string
  description = "cidr"
  default     = "us-east-1b" 
}
#AMI
variable ami_id {
  type        = string
  description = "cidr"
  default     = "ami-00b8917ae86a424c9" 
}

#Instance Type
variable instance_type {
  type        = string
  description = "cidr"
  default     = "t2.micro" 
}

#DB_USERNAME
variable db_username {
  type        = string
  description = "description"
  default     = "admin"
}

#DB_PASS
variable db_password {
  type        = string
  description = "description"
  default     = "admin123"
}

#DB_AZ
variable availability_zone {
  type        = string
  description = "description"
  default     = "us-east-1a"
}