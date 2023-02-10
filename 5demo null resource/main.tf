locals {
  students=["reem","guy","pari"]
}

resource "null_resource" "students" {
}
output "student_names" {
    value = local.students[1]
}

