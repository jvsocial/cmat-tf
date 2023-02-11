variable "students" {
  default = ["reem","guy","pari"] 
}

output "students_names" {
    value = var.students
  
}

output "students_names_caps" {
    value = [for name in var.students : upper(name)]
  
}