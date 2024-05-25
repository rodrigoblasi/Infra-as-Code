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
  # "VM.Standard.A1.Flex, 1 ocpu+ 6gb ram" = aarm64 =  always free Tier
  default = "VM.Standard.A1.Flex"
  #"VM.Standard.E2.1" = expensive as fuck
  # default = "VM.Standard.E2.1"
}

variable "ocpus" {
  type    = number
  default = 1
}

variable "memory_in_gbs" {
  type    = number
  #Always Free Tier = MAX 24gb somado entre as instancias!
  # 6gb ram x4 instancias OR 8gb x3 instancias
  default = 6
}

variable "image_id" {
  type    = string
  # Rocky Linux 8.7 x86_64
  #default = "ocid1.image.oc1..aaaaaaaa6ccbrxnbumu3pgej4fkz4hocepobygopdkwfyp5jxeww7ykrf2aq"
  # Rocky Linux 8.7 aarm = Free tier
  default = "ocid1.image.oc1..aaaaaaaa4bhzxdzvzl2ekifexq23ygl7bkw5v3lk7eamleusll25o7eyd52q"
  #Ubuntu 22.04 Minimal aarch64 = Free Tier
  #default = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaafyfvel5uwzbalj4uuzqqlv67npw65vvq63ce6qpg6nrkee4hseua"
  #Ubuntu 22.04 aarch64 = free Tier
  #default = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaxl7vfxg4tcbk6wiceqcbzvhny4ztvtpsbspg6xbpdk2wjvwnaj3a"
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
  default     = 0
}

variable "num_k8smaster_instances" {
  description = "Número de instâncias de k8smaster a serem criadas"
  default     = 1
}

variable "num_k8sworker_instances" {
  description = "Número de instâncias de k8sworker a serem criadas"
  default     = 3
}