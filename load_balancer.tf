resource "aws_lb" "load-balancer" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.load-balancer-sg.id]
  subnets            = [aws_subnet.my-app-subnet-1.id, aws_subnet.my-app-subnet-2.id]

  enable_deletion_protection = false
  tags = {
    Name = "load-balancer"
  }
}

resource "aws_lb_target_group" "alb-target" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app-VPC.id
}


resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.load-balancer.arn
  port              = "80"
  protocol          = "HTTP"
  tags = {
    Name = "listener"
  }
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target.arn
  }
}