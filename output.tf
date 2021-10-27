output "instance_name" {
    value = aws_instance.demo05.id
}
variable "sgname" {
  
}


# output "eip" {
#   value = aws_eip.eip.address
# }