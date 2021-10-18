output "public_lb_endpoint" {
  value = aws_lb.public_lb.dns_name
}

output "private_lb_endpoint" {
  value = aws_lb.private_lb.dns_name
}

output "apptier_endpoint_private" {
  value = aws_route53_record.apptier.name
}

output "dbtier_endpoint_private" {
  value = aws_route53_record.dbtier.name
}
