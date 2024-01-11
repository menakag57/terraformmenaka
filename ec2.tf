#PUB INSTANCE 1
resource "aws_instance" "web1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.pvtsub1.id
  vpc_security_group_ids =[aws_security_group.pvt-seg.id]
  key_name = "kops-helm"
  user_data = file("web-apps.sh")
  tags = {
    Name = "webserver1"
  }
  connection {
    type = "ssh"
    host = self.public_ip # Understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("kops-helm.pem")
  }  
  provisioner "file" {
    source      = "apps/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo cp /tmp/index.html /var/www/html"
    ]
  }
}

#PUB INSTANCE 2
resource "aws_instance" "web2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.pvtsub2.id
  vpc_security_group_ids =[aws_security_group.pvt-seg.id]
  key_name = "kops-helm"
  user_data = file("web-apps.sh")
  tags = {
    Name = "webserver2"
  }
  connection {
    type = "ssh"
    host = self.public_ip # Understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("kops-helm.pem")
  }
  provisioner "file" {
    source      = "apps/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo cp /tmp/index.html /var/www/html"
    ]
  }
}

