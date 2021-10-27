output "instance_name" {
    value = aws_instance.demo05.id
}

output "instance_name_ip" {
    value = aws_instance.demo05.public_ip
}



# output "eip" {
#   value = aws_eip.eip.address
# }