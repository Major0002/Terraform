resource "aws_instance" "major" {
  ami                    = var.amiID[var.region]
  instance_type          = "t3.micro"
  key_name               = var.keypair
  vpc_security_group_ids = [aws_security_group.major_sg.id]
  availability_zone      = var.zone1

  tags = {
    Name    = "Major-web"
    Project = "Major mobile App"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("majorkey")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo {self.private_ip} >> private_ips.txt"
  }
}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.major.id
  state       = "running"
}

output "WebPublicIP" {
  description = "Instance Public IP"
  value       = aws_instance.major.public_ip
}

output "WebPrivateIP" {
  description = "Instance Private IP"
  value       = aws_instance.major.private_ip
}