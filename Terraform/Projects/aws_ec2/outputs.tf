output "ec2_public_ip" {
    description = "Public IP of Ec2 instance"
    value = aws_instance.terraform_instance.public_ip    
}

output "ec2_public_dns" {
    description = "Public DNS value of Ec2 instance"
    value = aws_instance.terraform_instance.public_dns
  
}
