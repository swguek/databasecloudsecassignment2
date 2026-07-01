resource "aws_instance" "web_app" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t3.micro"
  
  # 🌟 改成实验室网页里唯一的这个真实 Profile 名字
  iam_instance_profile        = "EC2InstanceProfile" 
  
  subnet_id                   = "subnet-0f8bc1214d76eb07d"
  vpc_security_group_ids      = ["sg-09a7ca28e56c2f58c"]

  tags = {
    Name = "migrated-web-app"
  }
}

resource "aws_instance" "db_tier" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t3.micro"
  
  # 🌟 同样改成这个
  iam_instance_profile        = "EC2InstanceProfile" 
  
  subnet_id                   = "subnet-0f8bc1214d76eb07d"
  vpc_security_group_ids      = ["sg-09a7ca28e56c2f58c"]

  tags = {
    Name = "migrated-db-tier"
  }
}