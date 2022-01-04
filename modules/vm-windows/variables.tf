variable project_name {
  type = string
  description = "Project Name"
}

variable environment {
  type = string
  description = "Environment"
}

# variable location {
#   type = string
#   description = "Resource Location"
# }

# variable rg_name {
#   type = string
#   description = "Resource Location"
# }

variable "subnet_id" {
  type = string
}

variable "vm_name" {
  type = list(string)
  default = ["VM01", "VM02"]
}