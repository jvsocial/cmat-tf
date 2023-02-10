locals {
  names = ["bob", "kevin", "stewart"]
}
resource "null_resource" "names" {
  count = 3
  triggers = {
    book = local.names[count.index]
}
}
output "name" {
  value = local.names[count.index]
}
