provider "openstack" {
  user_name   = "${var.cloudwatt_username}"
  password    = "${var.cloudwatt_password}"
  tenant_name = "${var.cloudwatt_tenant_name}"
  auth_url    = "${var.cloudwatt_auth_url}"
}
