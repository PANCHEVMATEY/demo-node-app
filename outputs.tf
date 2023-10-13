output "app_url" {
  value = aws_lb.load-balancer.dns_name
}