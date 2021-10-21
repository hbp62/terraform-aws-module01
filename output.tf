output "instance_name" {
    value = aws_instance.foo.*.id
}

output "eip" {
  value = aws_eip.eip.address
}