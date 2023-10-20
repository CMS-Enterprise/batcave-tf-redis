variable "env" {
  default = "dev"
}

variable "project" {
  default = "eppe"
}

variable "aws_region" {
  default = "us-east-1"
}


variable "vpc_lookup_override" {
  description = "Some VPCs don't follow standard naming conventions.  Use this to override the query used to lookup VPC names.  Accepts wildcard in form of '*'"
  default     = ""
  type        = string
}

variable "subnet_lookup_overrides" {
  description = "Some Subnets don't follow standard naming conventions.  Use this map to override the query used for looking up Subnets.  Ex: { private = \"foo-west-nonpublic-*\" }"
  default     = {}
  type        = map(string)
}

variable "create_s3_vpc_endpoint" {
  type        = bool
  description = "toggle on/off the creation of s3 vpc endpoint"
  default     = true
}

variable "vpc_endpoint_lookup_overrides" {
  description = "Some vpc endpoints don't follow standard naming conventions.  Use this map to override the query used for looking up Subnets.  Ex: { private = \"foo-west-nonpublic-*\" }"
  default     = ""
  type        = string
}

variable "nat_gateways_lookup_overrides" {
  description = "Some nat gateways don't follow standard naming conventions.  Use this map to override the query used for looking up Subnets.  Ex: { private = \"foo-west-nonpublic-*\" }"
  default     = ""
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    Owner = "Batcave"
  }
}