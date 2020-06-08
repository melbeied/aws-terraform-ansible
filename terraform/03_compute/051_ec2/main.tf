resource "aws_instance" "bastion" {
 
    ami = "ami-026dea5602e368e96"
    
    availability_zone = "us-east-2a"
    instance_type = var.instance_bastion_type
    key_name = var.aws_key_name
    vpc_security_group_ids = tolist(["${var.sg-public-id}"])
    subnet_id = element(var.sn-public-list, 0)
    associate_public_ip_address = true
    source_dest_check = false

    tags = {
        Name = "BastionVM-for-publicSub2a"
    }
}