#provider OCI
variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "region" {
  type = string
}
# KEYS
variable "OCICONSOLE_PrivateKey_path" {
  type = string
  #empty by default, only at terraform.tfvars
  default = ""
}

variable "OCICONSOLE_PublicKey_path" {
  type = string
  #empty by default, only at terraform.tfvars
  default = ""
}

variable "OCIINSTANCE_PrivateKey_path" {
  type = string
  #empty by default, only at terraform.tfvars
  default = ""
}

variable "OCIINSTANCE_PublicKey_path" {
  type = string
  #empty by default, only at terraform.tfvars
  default = ""
}
# ----
variable "availability_domain" {
  type    = string
  default = "example-availability-domain"
}

variable "compartment_id" {
  type    = string
  default = "ocid1.compartment.oc1..examplecompartmentid"
}

variable "shape" {
  type    = string
  default = "VM.Standard.A1.Flex"
}

variable "ocpus" {
  type    = number
  default = 1
}

variable "memory_in_gbs" {
  type    = number
  default = 6
}

variable "image_id" {
  type    = string
  # Rocky Linux 8.7 aarm
  default = "ocid1.image.oc1..aaaaaaaa4bhzxdzvzl2ekifexq23ygl7bkw5v3lk7eamleusll25o7eyd52q"
}

variable "public_subnet_id" {
  type    = string
  default = "ocid1.subnet.oc1..examplesubnetid"
}

variable "private_subnet_id" {
  type    = string
  default = "ocid1.subnet.oc1..examplesubnetid"
}

variable "num_infra_instances" {
  description = "Número de instâncias de infraestrutura a serem criadas"
  default     = 1
}

variable "num_k8smaster_instances" {
  description = "Número de instâncias de k8smaster a serem criadas"
  default     = 1
}

variable "num_k8sworker_instances" {
  description = "Número de instâncias de k8sworker a serem criadas"
  default     = 1
}