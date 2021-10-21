resource "aws_instance" "foo" {
  #count = var.instance_count
  ami           = "ami-087c17d1fe0178315" # us-west-2
  instance_type = var.instance_type
  tags = {
    "Name" = var.name#format("demo-%02d",(count.index + 1))
    
  }

}

resource "aws_eip" "eip" {
  instance = aws_instance.foo.id
  vpc      = true
}

output "eip" {
  value = aws_eip.eip.address
}






