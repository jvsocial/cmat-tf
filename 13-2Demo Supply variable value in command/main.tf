variable "box" {
	default = "surprise"
}

output "learning_vars" {
  value = var.box
}
/*
ru this script with below command to pass variabls
terraform.exe apply -var="box=gift"
*/