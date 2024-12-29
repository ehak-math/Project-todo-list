provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "todo_app" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  key_name      = "project-cm"

  tags = {
    Name = "TodoAppEC2"
  }
}

resource "aws_db_instance" "rds_mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "todo_db" 
  username             = "admin"
  password             = "Project123"
  skip_final_snapshot  = true
}
