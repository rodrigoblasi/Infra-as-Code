provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.OCICONSOLE_PrivateKey_path
  region           = var.region
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

resource "oci_core_instance" "infra_instances" {
  count               = var.num_infra_instances
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.shape
  shape_config {
    ocpus          = var.ocpus
    memory_in_gbs  = var.memory_in_gbs
  }
  source_details {
    source_id   = var.image_id
    source_type = "image"
  }
  display_name        = "infra0${count.index + 1}"
  # Interface de rede para a sub-rede pública
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.public_subnet_id
    private_ip       = "10.0.0.10${count.index + 1}"  # IP privado específico para a instância
  }
  metadata = {
    ssh_authorized_keys = file(var.OCIINSTANCE_PublicKey_path)
  } 
  preserve_boot_volume = false
}

resource "oci_core_instance" "k8smaster_instances" {
  count               = var.num_k8smaster_instances
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.shape
  shape_config {
    ocpus          = var.ocpus
    memory_in_gbs  = var.memory_in_gbs
  }
  source_details {
    source_id   = var.image_id
    source_type = "image"
  }
  display_name        = "k8smaster0${count.index + 1}"
  # Interface de rede para a sub-rede pública
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.public_subnet_id
    private_ip       = "10.0.0.11${count.index + 1}"  # IP privado específico para a instância
  }
  metadata = {
    ssh_authorized_keys = file(var.OCIINSTANCE_PublicKey_path)
  } 
  preserve_boot_volume = false
}

resource "oci_core_instance" "k8sworker_instances" {
  count               = var.num_k8sworker_instances
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.shape
  shape_config {
    ocpus          = var.ocpus
    memory_in_gbs  = var.memory_in_gbs
  }
  source_details {
    source_id   = var.image_id
    source_type = "image"
  }
  display_name        = "k8worker0${count.index + 1}"
  # Interface de rede para a sub-rede pública
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.public_subnet_id
    private_ip       = "10.0.0.12${count.index + 1}"  # IP privado específico para a instância
  }
  metadata = {
    ssh_authorized_keys = file(var.OCIINSTANCE_PublicKey_path)
  } 
  preserve_boot_volume = false
}