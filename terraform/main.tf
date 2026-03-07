terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "docker" {}

module "database" {
  source      = "./modules/database"
  environment = var.environment
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
  db_port     = var.db_port
}

module "minikube" {
  source          = "./modules/minikube"
  environment     = var.environment
  minikube_cpus   = var.minikube_cpus
  minikube_memory = var.minikube_memory
  k8s_namespace   = var.k8s_namespace
}

module "jenkins" {
  source       = "./modules/jenkins"
  environment  = var.environment
  jenkins_port = var.jenkins_port
}

module "dev_environment" {
  source          = "./modules/dev-environment"
  environment     = var.environment
  docker_registry = var.docker_registry
  k8s_namespace   = var.k8s_namespace
}
