resource "aws_ecs_task_definition" "app-task" {
  family                   = var.ecs_task_family
  container_definitions    = <<DEFINITION
  [
    {
      "name": "app-first-task",
      "image": "${aws_ecr_repository.app-ecr-repo.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 5000,
          "hostPort": 5000
        }
      ],
      "memory": 265,
      "cpu": 128
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = var.ecs_container_memory
  cpu                      = var.ecs_container_cpu
  execution_role_arn       = var.ecs_execution_role_arn
}