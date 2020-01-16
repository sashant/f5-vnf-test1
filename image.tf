module "f5_vnf_image" {
  source = "git::https://github.com/sakthishanmugam02/vnf-on-vpc-modules.git"
  ibmcloud_endpoint    = "test.cloud.ibm.com"
  ibmcloud_svc_api_key = "6ob7CwRoZBHnrz3JKZkF5wJ_JRsHaF2F1dxIV72-SMdq"
  vnf_cos_image_url    = "cos://us-south/vnfimagesstage/BIGIP-15.0.1-0.0.11.qcow2"
  vnf_cos_instance_id  = "3fae3104-d6cc-4c15-94db-2635e2cc50b9"
  vnf_vpc_image_name   = "f5-bigip-sashant-test1"
  vpc_name             = "sashant-vpc"
  region               = "${data.ibm_is_region.region.name}"
  resource_group_id    = "${data.ibm_resource_group.rg.id}"
}
