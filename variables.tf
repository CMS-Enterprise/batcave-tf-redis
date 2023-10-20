variable "env" {
  default = "dev"
}

variable "project" {
  default = "eppe"
}


variable "cluster_id" {
  default     = ""
  type        = string
}

variable "engine" {
  default     = ""
  type        = string
}

variable "engine_version" {
  default     = ""
  type        = string
}

variable "node_type" {
  default     = ""
  type        = string
}

variable "num_cache_nodes" {
  default     = 1
  type        = number
}

variable "parameter_group_name" {
  default     = ""
  type        = string
}

variable "port" {
  default     = 6379
  type        = number
}

variable "subnet_group_name" {
  type    = list(string)
  default = []
}

variable "tags" {
  type = map(string)
  default = {
    Owner = "Batcave"
  }
}