//ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtL4ddcVuXM2gSXrXFzA4JjB4BMVmUI5t9ffVrOoG8Ajg20HLYS0dga7Th0K4ZKlZSR8t3E8cfNayBrP91ltbOPDJXvDaUA4E0b/UW+qXaYpBvUcRcN9exm3+aUDPaswBCkCyBzj8EtY46eE7DlAzYkFF4r+AYFkZ/Pq6L0wZgVKTXyjqUDmLB2W8wbn8sXIw4ZuoGLJ2FcjSPauxLFVANwCQgr6gJM8OhXXnIAPLgdn0hgFC131vrFM42Hpdky2EpHqfuXe3AltOeacAcHKo8QBK0rZ1xjheuiKgQUDU9jdEEA4RUiPW6Ma9c0ZKPNJUZy5yMm3Qu4URUZBLEoWoJ mohammedelbeied@Air-de-Mohammed
resource "aws_key_pair" "terraform_ec2_key" {
  key_name = "terraform_ec2_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtL4ddcVuXM2gSXrXFzA4JjB4BMVmUI5t9ffVrOoG8Ajg20HLYS0dga7Th0K4ZKlZSR8t3E8cfNayBrP91ltbOPDJXvDaUA4E0b/UW+qXaYpBvUcRcN9exm3+aUDPaswBCkCyBzj8EtY46eE7DlAzYkFF4r+AYFkZ/Pq6L0wZgVKTXyjqUDmLB2W8wbn8sXIw4ZuoGLJ2FcjSPauxLFVANwCQgr6gJM8OhXXnIAPLgdn0hgFC131vrFM42Hpdky2EpHqfuXe3AltOeacAcHKo8QBK0rZ1xjheuiKgQUDU9jdEEA4RUiPW6Ma9c0ZKPNJUZy5yMm3Qu4URUZBLEoWoJ mohammedelbeied@Air-de-Mohammed"
//  public_key = "${file("terraform_ec2_key.pub")}"
}
resource "aws_instance" "bastion" {
 
    ami = "ami-026dea5602e368e96"
    
    availability_zone = "us-east-2a"
    instance_type = var.instance_bastion_type
    //key_name = var.aws_key_name
    key_name = "terraform_ec2_key"
    vpc_security_group_ids = tolist(["${var.sg-public-id}"])
    subnet_id = element(var.sn-public-list, 0)
    associate_public_ip_address = true
    source_dest_check = false

    tags = {
        Name = "BastionVM-for-publicSub2a"
    }
}