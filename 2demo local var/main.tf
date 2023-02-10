# using local variable block 
locals {
  student="reem"
}

#refrencing or using variable 
output "student_name" {
    value = local.student
}

