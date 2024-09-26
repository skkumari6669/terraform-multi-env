resource "aws_security_group" "allow_ssh_terraform" {
  name = "allow-ssh-${var.environment}"
  description = "allow all traffic inbound and out bound"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "allow-ssh-${var.environment}"  
    }
  )

}

resource "aws_instance" "expense_proj" {
    ami = "ami-09c813fb71547fc4f"
    for_each  = var.instances
    instance_type = each.value
    vpc_security_group_ids = [ aws_security_group.allow_ssh_terraform.id ]
    tags = merge(
      var.common_tags,
       {
         Name = each.key
       }
    )

}
