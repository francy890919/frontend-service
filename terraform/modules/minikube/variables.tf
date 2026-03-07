variable "environment" {
  type = string
}

variable "minikube_cpus" {
  type    = number
  default = 2
}

variable "minikube_memory" {
  type    = number
  default = 2048
}

variable "k8s_namespace" {
  type = string
}
