# Look up the default security group already attached to the lab VPC
data "aws_security_group" "default_sg" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "group-name"
    values = ["default"]
  }
}