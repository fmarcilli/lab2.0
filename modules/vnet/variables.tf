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

variable "vnet_name" {
   type = string
 }


 variable "address_space" {
  type        = list(string)
 }

 variable "address_prefixes" {
    type        = list(string)
 }



