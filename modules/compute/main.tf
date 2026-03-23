# ─── EC2 SECURITY GROUP ───────────────────────────────────────────────────────
resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "Security group for EC2 instances - only allows traffic from ALB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP only from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}

# ─── EC2 INSTANCES ────────────────────────────────────────────────────────────
resource "aws_instance" "app" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = var.private_subnet_ids[count.index]
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd
    echo "<h1>Hello from $(hostname -f)</h1><p>Instance ${count.index + 1} is serving this page.</p>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "${var.project_name}-app-server-${count.index + 1}"
  }
}