# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "cgw-08786c525594ec8ab"
resource "aws_customer_gateway" "cgw" {
  bgp_asn         = "65000"
  certificate_arn = null
  device_name     = null
  ip_address      = "76.17.40.247"
  tags = {
    Name = "home"
  }
  tags_all = {
    Name = "home"
  }
  type = "ipsec.1"
}


# __generated__ by Terraform from "vgw-0686b5126ace05778"
resource "aws_vpn_gateway" "vpn_gateway" {
  amazon_side_asn   = "64512"
  availability_zone = null
  tags = {
    Name = "home"
  }
  tags_all = {
    Name = "home"
  }
  vpc_id = "vpc-035e720f714117f62"
}


# __generated__ by Terraform
resource "aws_vpn_connection" "vpn_connection1" {
  customer_gateway_id      = "cgw-08786c525594ec8ab"
  local_ipv4_network_cidr  = "0.0.0.0/0"
  outside_ip_address_type  = "PublicIpv4"
  static_routes_only       = true
  tags = {
    Name = "aws-home-vpn"
  }
  tags_all = {
    Name = "aws-home-vpn"
  }
  tunnel1_inside_cidr                     = "169.254.9.248/30"
  tunnel1_preshared_key                   = null # sensitive
  tunnel1_startup_action                  = null
  tunnel_inside_ip_version                = "ipv4"
  type                                    = "ipsec.1"
  vpn_gateway_id                          = "vgw-0686b5126ace05778"
}

# __generated__ by Terraform
resource "aws_instance" "tester" {
  ami                                  = "ami-0f34c5ae932e6f0e4"
  availability_zone                    = "us-east-1c"
  instance_type                        = "t2.micro"
  key_name                             = "test_pair"
  private_ip                           = "172.31.30.255"
  subnet_id                            = "subnet-070d10d8afe68621f"
  tags = {
    Name = "testing"
  }
  tags_all = {
    Name = "testing"
  }
  vpc_security_group_ids      = ["sg-0ef176271e4cbc43d"]
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0ef176271e4cbc43d"
resource "aws_security_group" "nsg" {
  description = "default VPC security group"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["192.168.0.0/24"]
    description      = ""
    from_port        = -1
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "icmp"
    security_groups  = []
    self             = false
    to_port          = -1
    }, {
    cidr_blocks      = ["192.168.0.0/24"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = true
    to_port          = 0
  }]
  name                   = "default"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-035e720f714117f62"
}
