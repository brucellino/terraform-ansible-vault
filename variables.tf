# variables.tf
# Use this file to declare the variables that the module will use.

# A dummy variable is provided to force a test validation
variable "inventory_path" {
  type        = string
  description = "Path to the yaml file containing the inventory"
}
