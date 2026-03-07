output "minikube_status" {
  value = "running"
}

output "minikube_ip" {
  value = try(data.external.minikube_ip.result["ip"], "127.0.0.1")
}
