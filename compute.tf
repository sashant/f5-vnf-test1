data "ibm_is_region" "region" {
  name = "${var.region}"
}

data "ibm_is_subnet" "f5_subnet1"{
   identifier = "${var.subnet_id}"
}
data "ibm_resource_group" "rg" {
  name = "${var.resource_group}"
}
data "ibm_is_vpc" "f5_vpc" {
  name = "${var.vpc_name}"
}
data "ibm_is_zone" "zone" {
  name = "${var.zone}"
  region = "${data.ibm_is_region.region.name}"
}

data "ibm_is_ssh_key" "f5_ssh_pub_key" {
  name = "${var.ssh_key_name}"
}

data "ibm_is_instance_profile" "vnf_profile" {
  name = "${var.vnf_profile}"
}

resource "ibm_is_instance" "f5_vsi" {
  name    = "${var.vnf_instance_name}"
  image   = "${module.f5_vnf_image.custom_image_id}"
  profile = "${data.ibm_is_instance_profile.vnf_profile.name}"

  primary_network_interface = {
    subnet = "${data.ibm_is_subnet.f5_subnet1.id}"
  }

  vpc  = "${data.ibm_is_vpc.f5_vpc.id}"
  zone = "${data.ibm_is_zone.zone.name}"
  keys = ["${data.ibm_is_ssh_key.f5_ssh_pub_key.id}"]

  # user_data = "$(replace(file("f5-userdata.sh"), "F5-LICENSE-REPLACEMENT", var.vnf_license)"

  //User can configure timeouts
  timeouts {
    create = "10m"
    delete = "10m"
  }
  # Hack to handle some race condition; will remove it once have root caused the issues.
  provisioner "local-exec" {
    command = "sleep 30"
  }
}

data "external" "delete_custom_image" {
  depends_on = ["ibm_is_instance.f5_vsi"]
  program    = ["bash", "${path.module}/scripts/delete_custom_image.sh"]

  query = {
    custom_image_id      = "${module.f5_vnf_image.custom_image_id}"
    ibmcloud_endpoint    = "${var.ibmcloud_endpoint}"
    ibmcloud_svc_api_key = "6ob7CwRoZBHnrz3JKZkF5wJ_JRsHaF2F1dxIV72-SMdq"
    region               = "${data.ibm_is_region.region.name}"
  }
}

