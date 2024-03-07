data "aws_route53_zone" "main" {
  name = var.domain.hosted_zone
}

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain.subdomain
  type    = "A"
  ttl     = "300"
  records = ["${pilvio_floatingip.web_public_ip.address}"]
}