provider "aws" {
  region = "us-east-1" # Set your desired AWS region
}

# vpc id
resource "aws_subnet" "example" {
  vpc_id     = "vpc-0f45adf48c2422e8a"
  cidr_block = "10.202.196.0/23"

  tags = {
    Name = "my-subnet"
  }
}

# private subnets
data "aws_subnets" "private" {
  filter {
    name = "tag:Name"
    values = [
      try(var.subnet_lookup_overrides.private, "${var.project}-*-${var.env}-private-*")
    ]
  }
}

# public subnets
data "aws_subnets" "public" {
  filter {
    name = "tag:Name"
    values = [
      try(var.subnet_lookup_overrides.public, "${var.project}-*-${var.env}-public-*")
    ]
  }
}



## subnet resources
data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}


resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-eppe"
  engine               = "redis"
  engine_version       = "6.x"
  node_type            = "cache.t4.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  port                 = 6379
  security_group_ids   = [aws_security_group.redis.id]

  subnet_group_name = aws_elasticache_subnet_group.redis.name

  tags = var.tags
}

resource "aws_security_group" "redis" {
  name_prefix = "${var.project}-redis-${var.env}"
  vpc_id      = "vpc-0f45adf48c2422e8a"

  // egress {
  //   from_port        = 0
  //   to_port          = 0
  //   protocol         = "-1"
  //   cidr_blocks      = ["0.0.0.0/0"]
  //   ipv6_cidr_blocks = ["::/0"]
  // }

  // tags = {
  //   Name = "allow_tls"
  // }
}


resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.project}-redis-${var.env}"
  description = "My subnet group"
  subnet_ids = [aws_subnet.example.id] # Replace with your subnet IDs
}

// output "redis_endpoint" {
//   value = aws_elasticache_cluster.redis.cache_nodes.0.endpoint
// }