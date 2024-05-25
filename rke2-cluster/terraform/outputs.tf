output "infra_instance_details" {
  value = [
    for instance in oci_core_instance.infra_instances : {
      display_name = instance.display_name
      state        = instance.state
      public_ip    = instance.public_ip
      private_ip   = instance.private_ip
      ocid         = instance.id
    }
  ]
}

output "k8smaster_instance_details" {
  value = [
    for instance in oci_core_instance.k8smaster_instances : {
      display_name = instance.display_name
      state        = instance.state
      public_ip    = instance.public_ip
      private_ip   = instance.private_ip
      ocid         = instance.id
    }
  ]
}

output "k8sworker_instance_details" {
  value = [
    for instance in oci_core_instance.k8sworker_instances : {
      display_name = instance.display_name
      state        = instance.state
      public_ip    = instance.public_ip
      private_ip   = instance.private_ip
      ocid         = instance.id
    }
  ]
}