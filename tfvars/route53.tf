resource "aws_route53_record" "records_information" {
  for_each = aws_instance.expense_proj
  zone_id = var.hosted_zone_id
  name    = each.key == "frontend-prod" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = each.key == "frontend-${var.environment}" ? [each.value.public_ip] : [each.value.private_ip]
  # records         = startswith(each.key, "frontend") ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}

 



