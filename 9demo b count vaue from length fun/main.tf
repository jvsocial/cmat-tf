locals {
  names = ["bob", "kevin", "stewart","reem"]
}
resource "null_resource" "names" {
  count = length(local.names)
  triggers = {
    name = local.names[count.index]
  }
}

output "name" {
  value = null_resource.names
}