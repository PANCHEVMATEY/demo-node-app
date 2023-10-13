resource "aws_ecs_cluster" "my-node-app" {
  name = "my-node-app"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}