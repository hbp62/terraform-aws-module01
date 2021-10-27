



resource "aws_security_group" "testdemo" {
  name        = "testdemo"
  description = "Allow TCP inbound traffic"
  vpc_id      = data.aws_vpc.main.id
  

  ingress = [
    {
      description      = "inbound rule"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.test.cidr_block]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  egress = [
    {
      description      = "outbound rule"
      from_port        = 0
      to_port          = 0
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
      
      
    }
  ]

  tags = {
    Name = "test-demo"
  }
}
# resource "aws_eip" "eip" {
#   instance = aws_instance.foo.id
#   vpc      = true
# }

data "aws_vpc" "main" {
  id = "vpc-fb224586"
}

resource "aws_vpc" "test" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "test"
  }
}

resource "aws_instance" "demo05" {
  #count = var.instance_count
  ami           = "ami-087c17d1fe0178315" # us-west-2
  instance_type = var.instance_type
  security_groups = [aws_security_group.testdemo.name]
  tags = {
    Name = var.name#format("demo-%02d",(count.index + 1))
    
  }

}




