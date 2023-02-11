resource "null_resource" "sandbox" {
  provisioner "local-exec" {
    command = "echo all is well"
  }
}