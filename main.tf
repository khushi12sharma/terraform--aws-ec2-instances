
resource "aws_instance" "web" {
  ami           = "ami-0741dc526e1106ae5"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id
  key_name = var.key

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "ngnix-server"
  }
}