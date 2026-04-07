output "elastic_ip" {
  description = "Elastic IP address of the EC2 instance"
  value       = aws_eip.web_eip.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.web_server.public_dns
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web_server.id
}
