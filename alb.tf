resource "aws_lb" "ALB" {
  name               = "my-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pub-seg.id]
  tags = {
    Name = "ALB"
  }
   subnet_mapping {
    subnet_id     = aws_subnet.pubsub1.id
  }
     subnet_mapping {
    subnet_id     = aws_subnet.pubsub2.id
  }
}
  resource "aws_lb_target_group" "ALB_Target" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id
}
 resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB_Target.arn
  }
}
resource "aws_lb_target_group_attachment" "targetinstance1" {
  target_group_arn = aws_lb_target_group.ALB_Target.arn
  target_id        = aws_instance.web1.id
}
resource "aws_lb_target_group_attachment" "targetinstance2" {
  target_group_arn = aws_lb_target_group.ALB_Target.arn
  target_id        = aws_instance.web2.id
}