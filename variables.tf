variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "workshop-devops-na-nuvem"
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
    cidr = string
  })
}