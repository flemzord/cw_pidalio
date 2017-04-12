variable "cloudwatt_username" {
  description = "Username for cloudwatt"
}

variable "cloudwatt_password" {
  description = "Password for cloudwatt"
}

variable "cloudwatt_tenant_name" {
  description = "Tenant name for cloudwatt"
}

variable "cloudwatt_auth_url" {
  description = "Auth url for cloudwatt"
}

variable "cloudwatt_key_name" {
  description = "Key Name for Cloudwatt"
}

variable "cloudwatt_flavor" {
  description = "Flavor for cloudwatt"
  default     = "19"
}

variable "cloudwatt_image_name" {
  description = ""
  default     = "CoreOS Stable 1296.6 - Python"
}

variable "k8s_fr1_count" {
  description = ""
  default     = "3"
}
