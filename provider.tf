provider "ibm" {
#  ibmcloud_api_key      = "${var.ibmcloud_api_key}"
  generation            = "2"
  region                = "us-south"
  resource_group        = "Default"
  ibmcloud_timeout      = 300
}