output "environment" {
  description = "Current deployment environment"
  value       = var.environment
}

output "minikube_status" {
  description = "Minikube cluster status"
  value       = module.minikube.minikube_status
}

output "minikube_ip" {
  description = "Minikube cluster IP"
  value       = module.minikube.minikube_ip
}

output "database_connection" {
  description = "Database connection string"
  value       = module.database.connection_string
  sensitive   = true
}

output "database_port" {
  description = "Database host port"
  value       = module.database.db_port
}

output "jenkins_url" {
  description = "Jenkins server URL"
  value       = module.jenkins.jenkins_url
}

output "docker_registry" {
  description = "Docker registry information"
  value       = module.dev_environment.docker_registry
}

output "k8s_namespace" {
  description = "Kubernetes namespace for this environment"
  value       = module.dev_environment.k8s_namespace
}

output "service_urls" {
  description = "Service URLs for CI/CD pipeline"
  value = {
    frontend = "http://${module.minikube.minikube_ip}:5000"
    product  = "http://${module.minikube.minikube_ip}:3001"
    order    = "http://${module.minikube.minikube_ip}:3002"
  }
}
