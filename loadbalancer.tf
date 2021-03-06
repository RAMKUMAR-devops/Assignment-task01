resource "aws_alb_target_group" "webtier_target_group" {
  name     = "webtier-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }

  tags = { 
    Name = "webtier-target-group" 
  }
}

resource "aws_alb_target_group" "apptier_target_group" {
  name     = "apptier-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }

  tags = { 
    Name = "apptier-target-group" 
  }
}

resource "aws_lb" "public_lb" {
  name               = "public-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.my_public_subnet_1.id, aws_subnet.my_public_subnet_2.id]
  security_groups    = [aws_security_group.public_lb_sg.id]

  tags = { 
    Name = "public-lb" 
  }
}

resource "aws_lb_listener" "public_lb_listener_80" {
  load_balancer_arn = aws_lb.public_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.webtier_target_group.arn
  }
}

resource "aws_lb" "private_lb" {
  name               = "private-lb"
  internal           = true
  load_balancer_type = "application"
  subnets            = [aws_subnet.my_private_subnet_1.id, aws_subnet.my_private_subnet_2.id]
  security_groups    = [aws_security_group.private_lb_sg.id]

  tags = { 
    Name = "private-lb"
  }
}

resource "aws_lb_listener" "private_lb_listener_80" {
  load_balancer_arn = aws_lb.private_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.apptier_target_group.arn
  }
}
