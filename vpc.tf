# 1. Look up the pre-existing AWS Academy default VPC
data "aws_vpc" "default" {
  default = true
}

# 2. Look up the pre-existing subnets already built inside the lab environment
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}