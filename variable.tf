variable "ibmcloud_endpoint" {
  default     = "cloud.ibm.com"
  description = "The IBM Cloud environmental variable 'cloud.ibm.com' or 'test.cloud.ibm.com'"
}

variable "vnf_instance_name" {
  default     = "f5-1arm-vsi01"
  description = "The name of your F5-BIGIP Virtual Server to be provisioned."
}

##############################################################################
# vnf_profile - The profile of compute CPU and memory resources to be used when provisioning F5-BIGIP VSI.
##############################################################################
variable "vnf_profile" {
  default     = "bx2-2x8"
  description = "The profile of compute CPU and memory resources to be used when provisioning F5-BIGIP VSI. To list available profiles, run `ibmcloud is instance-profiles`."
}

variable "resource_group" {
  default     = "Default"
  description = "The resource group to use. If unspecified, the account's default resource group is used."
}

variable "vpc_name" {
  default     = ""
  description = "The name of your VPC where F5-BIGIP VSI is to be provisioned."
}

variable "region" {
  default     = "us-south"
  description = "The VPC Region that you want your VPC, networks and the F5 virtual server to be provisioned in. To list available regions, run `ibmcloud is regions`."
}

variable "subnet_id"{
  default = ""
  description =" The id of the subnet where F5-BIGIP VSI to be provisioned."
}

variable "ssh_key_name" {
  default     = ""
  description = "The name of the public SSH key to be used when provisining F5-BIGIP VSI."
}

variable "zone" {
  default     = "us-south-1"
  description = "The VPC Zone that you want your VPC networks and virtual servers to be provisioned in. To list available zones, run `ibmcloud is zones`."
}