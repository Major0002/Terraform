variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "keypair" {
  default = "major-key"
}

variable "amiID" {
  type = map(any)
  default = {
    us-east-1      = "ami-0ecb62995f68bb549"
    us-west-2      = "ami-0c398cb65a93047f2"
    eu-west-1      = "ami-0c1a7f89451184c8b"
    eu-central-1   = "ami-0a1ee2c3788383fb1"
    ap-southeast-1 = "ami-03f4878755434977f"
  }
}
