locals {
  actors=["amar","akbar","anthony"]
}

resource "null_resource" "act" {
  count = length(local.actors)
}