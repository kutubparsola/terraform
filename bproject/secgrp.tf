# Automatically fetches your current public IP address
data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

resource "aws_security_group" "websg" {
  name   = "websg"
  vpc_id = aws_vpc.ofvpc.id

  ingress {
    description = "allowing http"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allowing ssh from my current ip only"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    # Automatically appends "/32" to your dynamically fetched IP
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}
