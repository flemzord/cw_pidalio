resource "openstack_networking_network_v2" "k8s_network_fr1" {
  name           = "k8s_network_fr1"
  admin_state_up = "true"
  region         = "fr1"
}

resource "openstack_networking_subnet_v2" "k8s_subnet_fr1" {
  name       = "k8s_subnet_fr1"
  network_id = "${openstack_networking_network_v2.k8s_network_fr1.id}"
  cidr       = "192.168.1.0/24"
  ip_version = 4
  region     = "fr1"
}

resource "openstack_compute_secgroup_v2" "k8s_secgroup_fr1" {
  name        = "k8s_secgroup_fr1"
  description = "k8s security group in fr1"
  region      = "fr1"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 6443
    to_port     = 6443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

}

resource "openstack_networking_floatingip_v2" "k8s_fip_fr1" {
  pool   = "public"
  region = "fr1"
  count  = "${var.k8s_fr1_count}"
  region = "fr1"
}

resource "openstack_compute_instance_v2" "k8s_server_fr1" {
  name            = "k8s-${count.index + 1}"
  image_name      = "${var.cloudwatt_image_name}"
  flavor_id       = "${var.cloudwatt_flavor}"
  key_pair        = "${var.cloudwatt_key_name}"
  security_groups = ["${openstack_compute_secgroup_v2.k8s_secgroup_fr1.name}"]
  count           = "${var.k8s_fr1_count}"
  region          = "fr1"

  network {
    name = "${openstack_networking_network_v2.k8s_network_fr1.name}"
  }
}

resource "openstack_compute_floatingip_associate_v2" "k8s_attach_fip_fr1" {
  floating_ip = "${element(openstack_networking_floatingip_v2.k8s_fip_fr1.*.address, count.index)}"
  instance_id = "${element(openstack_compute_instance_v2.k8s_server_fr1.*.id, count.index)}"
  region      = "fr1"
  count       = "${var.k8s_fr1_count}"
}
