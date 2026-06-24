output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.web.public_ip
}

output "private_ip" {
  description = "Private IP of EC2"
  value       = aws_instance.web.private_ip
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.ec2_sg.id
}

output "website_url" {
  description = "Nginx Website URL"
  value       = "http://${aws_instance.web.public_ip}"
}