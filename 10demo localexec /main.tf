resource "null_resource" "sandbox" {
  provisioner "local-exec" {
    command = "echo all is well"
  }
}

resource "null_resource" "sandbox2" {
  provisioner "local-exec" {
    command = "echo all is well >> temp.txt"
  }
}