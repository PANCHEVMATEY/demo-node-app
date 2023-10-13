variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet1_cidr_block" {
  description = "CIDR block for the first subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr_block" {
  description = "CIDR block for the second subnet"
  type        = string
  default     = "10.0.1.1/24"
}

variable "subnets_availability_zone" {
  description = "Availability zone for the subnets"
  default = {
    availability_1a = "eu-central-1a"
    availability_1b = "eu-central-1b"
  }
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "app-first-service"
}

variable "ecs_launch_type" {
  description = "Launch type for the ECS service"
  type        = string
  default     = "FARGATE"
}

variable "ecs_desired_count" {
  description = "Desired number of tasks for the ECS service"
  type        = number
  default     = 1
}

variable "ecs_subnets" {
  description = "IDs of the subnets for the ECS service"
  type        = list(string)
  default     = []
}

variable "ecs_assign_public_ip" {
  description = "Assign a public IP to tasks"
  type        = bool
  default     = true
}

variable "ecs_security_groups" {
  description = "IDs of the security groups for the ECS service"
  type        = list(string)
  default     = []
}

variable "ecs_task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default     = "app-first-task"
}

variable "ecs_container_memory" {
  description = "Memory limit for the container"
  type        = number
  default     = 265
}

variable "ecs_container_cpu" {
  description = "CPU limit for the container"
  type        = number
  default     = 128
}

variable "ecs_execution_role_arn" {
  description = "ARN of the execution role for ECS tasks"
  type        = string
}

variable "load_balancer_name" {
  description = "Name for the AWS Application Load Balancer"
  type        = string
  default     = "Load-Balancer"
}

variable "load_balancer_type" {
  description = "Type of the Load Balancer (e.g., application)"
  type        = string
  default     = "application"
}

