resource "aws_instance" "backend" {
  ami           = "ami-07d9b9ddc6cd8dd30" // Ubuntu 
  instance_type = "t2.micro"
  subnet_id     = "subnet-025d9dfd5865ddda9" // Default VPC

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "backend_machine"
  }

  // Enable public IP
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  key_name                    = "ahmedabdelhodhod"


  connection {
    type        = "ssh"
    host        = aws_instance.backend.public_ip // Use the public IP of the instance
    user        = "ubuntu"                       // Replace with the appropriate username
    private_key = file("ahmedabdelhodhod.pem")   // Path to your SSH private key file
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y php php-cli php-mbstring php-xml php-mysql php-zip php-gd php-json",
      "sudo apt-get install -y composer",

    ]
  }


}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}

output "server_public_ip" {
  value = aws_instance.backend.public_ip
}
