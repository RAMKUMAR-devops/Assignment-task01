
resource "aws_key_pair" "server_key" {
  key_name   = "server_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbb71xvhhu17PzSHNMGtUeoo1cEiw0HTW370njTBHiq/MRameGBAab75veiZPEV/oemcIg6STzLl9yPNlr6gm4vWaViyNnEGWaH1CPXwhbT//TMsjMVAc0wlyENlLMt6ttZ/FzVYe/if5lW6124/YDQXyq8pbPsBpIXiF+4IW259er0boL6Oy5Aw1xMujZPnxykyozfZ/tNjUOZncsl7YJ+TxX6yDpOcGXbT5put0sAGI39SVw1LrO1ub1Xat05Oc71+SktwSjMQ/L3p2wULEwaZvlO/iATKOenRcwiBp0f4kJduP5ButVTHkgJPI9Qadumrh6qSJ+lRfT3S0heYR1 root@ip-172-31-23-185.ec2.internal"
}

data "aws_ami" "amazon_linux_2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_launch_template" "web_tier_template" {
  name = "web-tier-launch-template"

  image_id = data.aws_ami.amazon_linux_2.id

  instance_type = var.instance_type

  key_name = aws_key_pair.server_key.id

  vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "web-server",
      Tier = "web"
    }
  }

  user_data = base64encode(file("userdata.sh"))

}

resource "aws_launch_template" "app_tier_template" {
  name = "app-tier-launch-template"

  iam_instance_profile {
    name = aws_iam_instance_profile.aws_ec2_profile.name
  }

  image_id = data.aws_ami.amazon_linux_2.id

  instance_type = var.instance_type

  key_name = aws_key_pair.server_key.id

  vpc_security_group_ids = ["${aws_security_group.app_sg.id}"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "app-server",
      Tier = "app"
    }
  }

  user_data = base64encode(file("userdata.sh"))

}
