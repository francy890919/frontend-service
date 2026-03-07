resource "null_resource" "dev_environment_info" {
  provisioner "local-exec" {
    command = <<-EOT
      echo "Environment: ${var.environment}"
      echo "Docker Registry: ${var.docker_registry}"
      echo "K8s Namespace: ${var.k8s_namespace}"
    EOT
  }
}
