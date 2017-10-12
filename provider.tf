provider "openstack" {
	user_name   = "${var.OStack-Admin}"
	tenant_name = "${var.OStack-Admin}"
	password    = "${var.OStack-password}"
	auth_url    = "${var.auth_url}"
	region      = "${var.Region}"
}