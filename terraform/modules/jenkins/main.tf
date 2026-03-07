resource "null_resource" "jenkins_status" {
  provisioner "local-exec" {
    command = "docker ps | grep jenkins || echo 'Jenkins container not running'"
  }
}
