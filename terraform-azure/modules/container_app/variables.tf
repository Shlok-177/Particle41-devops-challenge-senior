variable "resource_group_name" {}
variable "location" {}
variable "container_app_name" {}
variable "container_image" {}
variable "subnet_id" {
  description = "Subnet ID for VNet Integration"
  type        = string
}
