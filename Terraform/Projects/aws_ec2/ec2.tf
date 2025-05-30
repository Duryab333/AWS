# key pair 
resource "aws_key_pair" "ec2_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

# vpc
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# scurity group
resource "aws_security_group" "ec2_security_group" {
  name        = "allow_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id  # interpolaiton
  # inbound rule
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"

  }



  #outbount rule
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
    description = "all access open outbound"

  }

  tags = {
    Name = "allow_sg"
  }
}

# ec2 instance

resource "aws_instance" "terraform_instance" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name = aws_key_pair.ec2_key.key_name
  security_groups = [ aws_security_group.ec2_security_group.name ]

  root_block_device {
    volume_size = var.allow_root_stroage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "terraform_instance"
  }
}