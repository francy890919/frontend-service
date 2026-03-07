variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "minikube_cpus" {
  description = "Number of CPUs for Minikube"
  type        = number
  default     = 2
}

variable "minikube_memory" {
  description = "Memory for Minikube in MB"
  type        = number
  default     = 2048
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "devops_db"
}

variable "db_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "PostgreSQL password"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "db_port" {
  description = "PostgreSQL host port"
  type        = number
  default     = 5434
}

variable "jenkins_port" {
  description = "Jenkins host port"
  type        = number
  default     = 8081
}

variable "docker_registry" {
  description = "Docker Hub username"
  type        = string
  default     = "francyhsu123"
}

variable "k8s_namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "devops-dev"
}
