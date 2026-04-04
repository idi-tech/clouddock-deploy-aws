aws_region        = "us-east-1"
ami_id            = "ami-0c02fb55956c7d316"
instance_type     = "t3.micro"
key_name          = "clouddock-EC2-key"
instance_name     = "clouddock-web-server"
allowed_ssh_cidr  = ["154.73.21.3/32"]
allowed_http_cidr = ["0.0.0.0/0"]
