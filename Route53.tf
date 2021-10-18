resource "aws_route53_zone" "private_route53_zone" {
  name = "ramkumar.in"
  vpc {
    vpc_id = aws_vpc.myvpc.id
  }
}

resource "aws_route53_record" "apptier" {
  zone_id = aws_route53_zone.private_route53_zone.zone_id
  name    = "apptier.ramkumar.in"
  type    = "A"

  alias {
    name                   = aws_lb.private_lb.dns_name
    zone_id                = aws_lb.private_lb.zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "dbtier" {
  zone_id = aws_route53_zone.private_route53_zone.zone_id
  name    = "dbtier.ramkumar.in"
  type    = "CNAME"
  records = ["${aws_db_instance.rds.address}"]
  ttl     = 300
}
