resource "null_resource" "sandbox" {
  provisioner "local-exec" {
    command = "hostname"
  }
}

resource "null_resource" "sanddevboxa" {
  provisioner "local-exec" {
    command = "echo all is well"
  }
}