resource "aws_db_subnet_group" "custom_subnet_group" {
  name       = "custom-subnet-group"
  subnet_ids = ["subnet-025d9dfd5865ddda9", "subnet-05d8ab1d991de60da"] // Add subnets to cover at least 2 AZs.
}


#create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.64.0/20"] // only allow connection from subnet 1f 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine                 = "mysql"
  identifier             = "myrdsinstance"
  allocated_storage      = 20
  engine_version         = "8.0.35"
  instance_class         = "db.t2.micro"
  username               = "master"
  password               = "hodhod01144"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.custom_subnet_group.name

}

