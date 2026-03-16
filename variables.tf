variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "provide-subnets"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::235494818930:role/admin"
    region = "us-east-1"
  }
}

variable "vpc" {
  type = object({
    cidr                     = string
    name                     = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name                   = string
      cidr_block             = string
      availability_zone      = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                   = string
      cidr_block             = string
      availability_zone      = string
      map_public_ip_on_launch = bool
    }))
  })

  default = {
    cidr                     = "10.0.0.0/16"
    name                     = "workshop-march-vpc-3"
    internet_gateway_name    = "workshop-march-igw"
    nat_gateway_name         = "workshop-march-nat"
    public_route_table_name  = "workshop-march-public-rt"
    private_route_table_name = "workshop-march-private-rt"
    public_subnets = [
      {
        name                   = "workshop-march-public-1a"
        cidr_block             = "10.0.0.0/24"
        availability_zone      = "us-east-1a"
        map_public_ip_on_launch = true
      },
      {
        name                   = "workshop-march-public-1b"
        cidr_block             = "10.0.1.0/24"
        availability_zone      = "us-east-1b"
        map_public_ip_on_launch = true
      }
    ]
    private_subnets = [
      {
        name                   = "workshop-march-private-1a"
        cidr_block             = "10.0.10.0/24"
        availability_zone      = "us-east-1a"
        map_public_ip_on_launch = false
      },
      {
        name                   = "workshop-march-private-1b"
        cidr_block             = "10.0.11.0/24"
        availability_zone      = "us-east-1b"
        map_public_ip_on_launch = false
      }
    ]
  }
}