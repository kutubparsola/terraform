provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "backendBucket" {
  # Added a unique suffix to prevent global naming collisions
  bucket = "kutub2005-tf-backend-bucket"
}

resource "aws_instance" "server" {
  ami                    = var.ami
  instance_type          = var.instanceType
  vpc_security_group_ids = [aws_security_group.websg.id]
  key_name               = aws_key_pair.serverkey.id
  subnet_id              = aws_subnet.subnet1.id

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_ed25519")
    host        = self.public_ip
  }

  # Fixed destination filename so it matches your script
  provisioner "file" {
    source      = "./script.sh"
    destination = "/home/ubuntu/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      # Fixed the chmod typo and removed the invalid "sudo cd"
      "chmod +x /home/ubuntu/script.sh",
      "/home/ubuntu/script.sh"
    ]
  }
}
