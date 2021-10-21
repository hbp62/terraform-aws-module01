output "instance_name" {
    value = aws_instance.foo.*.id
}