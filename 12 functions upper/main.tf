variable "names" {
  description = "Just a list of names"
  type = list(string)
  default = ["bob", "kevin", "stewart"]
}

output "test_upper" {
  value = [for name in var.names : upper(name)]
}