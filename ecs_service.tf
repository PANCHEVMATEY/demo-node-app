resource "aws_ecs_service" "app_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.my-node-app.id
  task_definition = aws_ecs_task_definition.app-task.arn
  launch_type     = var.ecs_launch_type
  desired_count   = var.ecs_desired_count

  load_balancer {
    target_group_arn = aws_lb_target_group.alb-target.arn
    container_name   = aws_ecs_task_definition.app-task.family
    container_port   = 5000
  }

  network_configuration {
    subnets          = var.ecs_subnets
    assign_public_ip = var.ecs_assign_public_ip
    security_groups  = var.ecs_security_groups
  }
}