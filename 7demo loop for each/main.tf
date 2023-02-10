resource "null_resource" "students" {
  
  for_each = {
    student1 = "reem"
    student2="raam"
    student3="guy"
  }   
}

 output student_names {
    value=null_resource.students
  }