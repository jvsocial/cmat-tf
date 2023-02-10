locals {
  students=["reem","guy","pari"]
}

resource "null_resource" "students" {
  count = 3
}
output "student_names" {
    value = local.students[1]
}

