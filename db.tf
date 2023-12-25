resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  vpc_security_group_ids =[aws_security_group.pvt-seg.id]
  availability_zone = var.availability_zone
  db_subnet_group_name = aws_db_subnet_group.dbsubnet.id
}
resource "aws_db_subnet_group" "dbsubnet" {
  name       = "main"
  subnet_ids = [aws_subnet.pvtsub1.id, aws_subnet.pvtsub2.id]

  tags = {
    Name = "My DB subnet group"
  }
}