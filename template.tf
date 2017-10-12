#############################################
# Create a infra on Openstack With terraform
#############################################


##########
# SSH KEY
##########

# import key pair
resource "openstack_compute_keypair_v2" "ssh" {
  name       = "ssh"
  public_key = "${var.ssh}"
}

###############
# Network
###############

# Create a router 
resource "openstack_networking_router_v2" "router_001" {
  name             = "router_001"
  admin_state_up   = "true"
}
  
# Create a new network 
resource "openstack_networking_network_v2" "network_001" {
  name           = "network_001"
  admin_state_up = "true"
}

# Create a new subnet associated to network
resource "openstack_networking_subnet_v2" "subnet_001" {
  name            = "subnet_001"
  network_id      = "${openstack_networking_network_v2.network_001.id}"
  cidr            = "10.0.0.0/24"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

# Create an interface (router/subnet)
resource "openstack_networking_router_interface_v2" "int_001" {
  router_id = "${openstack_networking_router_v2.router_001.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_001.id}"
}

# Create an IP floating 
#resource "openstack_compute_floatingip_v2" "ip_floating_001" {
#  pool       = "${var.pool}"
#  depends_on = ["openstack_networking_router_interface_v2.router_001"]
#}

###################
# Security Group
###################

# create a new SG
resource "openstack_compute_secgroup_v2" "SG_001" {
  name        = "SG"
  description = "Security group for the Terraform example instances"
  
  # SSH RULE
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  
  # HTTP RULE
  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  
  # ICMP RULE
  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

###############
# Instance
###############

# Create an instance 
resource "openstack_compute_instance_v2" "instance_001" {
  name            = "${var.InstanceName}"
  image_name      = "${var.image}"
  flavor_name     = "${var.flavor}"
  key_pair        = "${openstack_compute_keypair_v2.ssh.name}"
  security_groups = ["${openstack_compute_secgroup_v2.SG_001.name}"]
#  floating_ip     = "${openstack_compute_floatingip_v2.ip_floating_001.address}"

  network {
    uuid = "${openstack_networking_network_v2.network_001.id}"
  }
}