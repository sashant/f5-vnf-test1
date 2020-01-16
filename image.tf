module "f5_vnf_image" {
  source = "git::https://github.com/sakthishanmugam02/vnf-on-vpc-modules.git"
  ibmcloud_endpoint    = ""
  ibmcloud_svc_api_key = ""
  vnf_cos_image_url    = ""
  vnf_cos_instance_id  = ""
  vnf_vpc_image_name   = ""
}
