resource "null_resource" "minikube_start" {
  triggers = {
    environment = var.environment
  }

  provisioner "local-exec" {
    command = <<-EOT
      minikube status || minikube start \
        --cpus=${var.minikube_cpus} \
        --memory=${var.minikube_memory} \
        --driver=docker \
        -p ${var.environment}
    EOT
  }
}

resource "null_resource" "k8s_namespace" {
  depends_on = [null_resource.minikube_start]

  provisioner "local-exec" {
    command = "kubectl create namespace ${var.k8s_namespace} --dry-run=client -o yaml | kubectl apply -f -"
  }
}

data "external" "minikube_ip" {
  depends_on = [null_resource.minikube_start]
  program    = ["bash", "-c", "echo '{\"ip\": \"'$(minikube ip 2>/dev/null || echo '127.0.0.1')'\"}'"]
}
