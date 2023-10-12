resource "aws_ecr_repository" "app-ecr-repo" {
  name = "app-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}