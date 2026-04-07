resource "aws_instance" "web_server" {
  subnet_id                   = aws_subnet.public_subnet.id
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name    = var.instance_name
    Project = "CloudDock Deploy"
  }
}

resource "aws_eip" "web_eip" {
  instance = aws_instance.web_server.id
  domain   = "vpc"

  tags = {
    Name = "${var.instance_name}-eip"
  }
}
