module "f5_vnf_image" {
  source = "git::https://github.com/sakthishanmugam02/vnf-on-vpc-modules.git"
  ibmcloud_endpoint    = "${var.ibmcloud_endpoint}"
  ibmcloud_svc_api_key = "${var.ibmcloud_svc_api_key}"
  vnf_cos_image_url    = "${var.vnf_cos_image_url}"
  vnf_cos_instance_id  = "${var.vnf_cos_instance_id}"
  vnf_vpc_image_name   = "${var.vnf_vpc_image_name}"
  vpc_crn              = "${data.ibm_is_vpc.f5_vpc.resource_crn}"
  region               = "${data.ibm_is_region.region.name}"
  resource_group_id    = "${data.ibm_resource_group.rg.id}"
}
