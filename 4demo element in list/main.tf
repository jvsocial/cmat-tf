locals {
  students=["reem","guy","pari"]
}

output "student_names" {
    value = local.students[1]
}

