output "instance_name" {
    value = aws_instance.var.Name.id
}

output "eip" {
  value = aws_eip.eip.address
}